//
//  TUIUserLocation.h
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseCachedModel.h"

/**
 TUIUserLocation represent the user's position
 */
@interface TUILocation : TUIBaseCachedModel

/**
 The latitude
 */
@property (nonatomic, strong) NSNumber *latitude;

/**
 The longitude
 */
@property (nonatomic, strong) NSNumber *longitude;

/**
 @methodName defaultUserLocation
 @abstract Returns the default user location
 @discussion This method will return the default user location
 
 @return The default user location
 */
+ (TUILocation *)defaultUserLocation;

@end
