//
//  TUIUserLocation.h
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseCachedModel.h"
#import <MapKit/MapKit.h>

/**
 TUIUserLocation represent the user's position
 */
@interface TUILocation : TUIBaseCachedModel <MKAnnotation>

/**
 The latitude
 */
@property (nonatomic, strong) NSNumber *latitude;

/**
 The longitude
 */
@property (nonatomic, strong) NSNumber *longitude;

@property (nonatomic) CLLocationCoordinate2D coordinate;

/**
 @methodName defaultUserLocation
 @abstract Returns the default user location
 @discussion This method will return the default user location
 
 @return The default user location
 */
+ (TUILocation *)defaultUserLocation;

@end
