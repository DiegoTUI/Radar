//
//  TUISettings.h
//  Radar
//
//  Created by Diego Lafuente on 09/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseCachedModel.h"


/**
 A class to store the settings of the app
 */
@interface TUISettings : TUIBaseCachedModel

/**
 The weather. Could be "Sunny" or "Cloudy"
 */
@property (nonatomic, copy) NSString *weather;

/**
 The autolocation switch.
 */
@property (nonatomic, strong) NSNumber *autolocation;

/**
 The latitude
 */
@property (nonatomic, strong) NSNumber *latitude;

/**
 The longitude
 */
@property (nonatomic, strong) NSNumber *longitude;

/**
 The autotime switch.
 */
@property (nonatomic, strong) NSNumber *autotime;

/**
 The time string.
 */
@property (nonatomic, copy) NSString *time;

/**
 @methodName initWithCache
 @abstract Inits the object with the contents of the cache
 @discussion This method inits a TUISettings object with the contents of the cache.
 Returns the default object if unable to retrieve from cache
 
 @return A valid TUISettings object
 */
- (id)initWithCache;

@end
