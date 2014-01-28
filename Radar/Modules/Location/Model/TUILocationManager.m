//
//  TUILocationManager.m
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUILocationManager.h"
#import <CoreLocation/CoreLocation.h>
// Models
#import "TUICache.h"
#import "TUISettings.h"

@interface TUILocationManager() <CLLocationManagerDelegate>

/**
 The location manager
 */
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation TUILocationManager


#pragma mark - Singleton -

+ (id)sharedManager
{
    static dispatch_once_t onceToken = 0;
    __strong static TUILocationManager *_sharedObject = nil;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[TUILocationManager alloc] init];
    });
    return _sharedObject;
}


#pragma mark - Init -

- (id)init
{
    self = [super init];
    if (self)
    {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return self;
}


#pragma mark - User Location -

- (void)startGettingUserLocation
{
    TUISettings *currentSettings = [TUISettings currentSettings];
    
    if ([currentSettings.autolocation boolValue])
    {
        [_locationManager startUpdatingLocation];
    }
    else
    {
        TUIUserLocation *userLocation = [[TUIUserLocation alloc] initWithLatitude:[currentSettings.latitude doubleValue]
                                                                        longitude:[currentSettings.longitude doubleValue]];
        [_delegate userLocationReady:userLocation];
    }
}


#pragma mark - CLLocationManager delegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    [_locationManager stopUpdatingLocation];
    CLLocation *location = [locations lastObject];
    // Store the location in the cache
    TUIUserLocation *userLocation = [[TUIUserLocation alloc] initWithLatitude:location.coordinate.latitude
                                                                    longitude:location.coordinate.longitude];
    [TUICache storeObject:userLocation forKey:CACHED_USER_LOCATION_KEY];
    // Call delegate
    [_delegate userLocationReady:userLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    //No location available, let's try cache
    TUIUserLocation *locationStored = (TUIUserLocation *)[TUICache readObjectOfClass:[TUIUserLocation class] forKey:CACHED_USER_LOCATION_KEY];
    if (locationStored) {
        // Call delegate
        [_delegate userLocationReady:locationStored];
    } else {
        //No location stored, return default
        [_delegate userLocationReady:[TUIUserLocation defaultUserLocation]];
    }
}

@end
