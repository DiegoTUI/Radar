//
//  TUIWeatherManager.h
//  Radar
//
//  Created by Diego Lafuente on 27/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"

/**
 TUIWeatherManager is used to manage the weather
 */
@interface TUIWeatherManager : TUIBaseModel

/**
 @methodName currentWeather
 @abstract Returns the current weather codified in a string
 @discussion This method returns the current weather codified in a string
 
 @return A string with the current weather
 */
+ (NSString *)currentWeather;

@end
