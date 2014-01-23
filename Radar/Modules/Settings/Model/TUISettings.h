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
 @methodName cachedSettings
 @abstract Creates a TUISettings object with the contents of the cache
 @discussion This method creates and returns a TUISettings object with the
 contents of the cache. Returns nil if no settings were found in the cache
 
 @return A TUISettings object parsed from the cache. Nil if nothing is found.
 */
+ (TUISettings *)cachedSettings;

/**
 @methodName defaultSettings
 @abstract Creates a default TUISettings object
 @discussion This method creates and returns a default TUISettings object
 
 @return A default TUISettings object.
 */
+ (TUISettings *)defaultSettings;

/**
 @methodName currentSettings
 @abstract Creates a TUISettings object with the current settings
 @discussion This method creates and returns a TUISettings object with the
 current settings. It tries cached settings first. If they are not nil it returns
 them. If they are nil, it returns the default settings
 
 @return A TUISettings object containing the current settings.
 */
+ (TUISettings *)currentSettings;

/**
 @methodName persist
 @abstract Stores the current TUISetting in the cache
 @discussion This method stores the current TUISetting in the cache, overwriting
 what was there before.
 
 */
- (void)persist;

@end
