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
@interface TUIUserLocation : TUIBaseCachedModel <MKAnnotation>

/**
 The user's location
 */
@property (nonatomic) CLLocationCoordinate2D coordinate;

/**
 @methodName initWithLatitude:longitude:
 @abstract Inits a TUIUserLocation object with the given coordinate
 @discussion This method will init a TUIUserLocation object with the given 
 coordinate and return the result
 
 @return A TUIUserLocation
 */
- (TUIUserLocation *)initWithLatitude:(CLLocationDegrees)latitude
                            longitude:(CLLocationDegrees)longitude;

/**
 @methodName defaultUserLocation
 @abstract Returns the default user location
 @discussion This method will return the default user location
 
 @return The default user location
 */
+ (TUIUserLocation *)defaultUserLocation;

@end
