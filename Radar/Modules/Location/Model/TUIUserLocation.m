//
//  TUIUserLocation.m
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIUserLocation.h"

@implementation TUIUserLocation


#pragma mark - Init -

- (TUIUserLocation *)initWithLatitude:(CLLocationDegrees)latitude
                            longitude:(CLLocationDegrees)longitude
{
    self = [super init];
    if (self)
    {
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = latitude;
        coordinate.longitude = longitude;
        self.coordinate = coordinate;
    }
    return self;
}


#pragma mark - Default user location -

+ (TUIUserLocation *)defaultUserLocation
{
    return[[TUIUserLocation alloc] initWithLatitude:DEFAULT_LATITUDE longitude:DEFAULT_LONGITUDE];
}

#pragma mark - Serializing -

- (NSDictionary *)dictionary
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    [result setValue:[NSNumber numberWithDouble:_coordinate.latitude] forKey:@"latitude"];
    [result setValue:[NSNumber numberWithDouble:_coordinate.longitude] forKey:@"longitude"];
    
    return result;
}


#pragma mark - Parsing -

+ (TUIBaseModel<TUISerializable> *)objectFromDictionary:(NSDictionary *)dictionary
{
    NSNumber *latitude = [dictionary objectForKey:@"latitude"];
    NSNumber *longitude = [dictionary objectForKey:@"longitude"];
    
    return [[TUIUserLocation alloc] initWithLatitude:[latitude doubleValue] longitude:[longitude doubleValue]];
}


#pragma mark - Description

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%p> Latitude: %f, Longitude: %f",
            self,
            self.coordinate.latitude,
            self.coordinate.longitude];
}

@end
