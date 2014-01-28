//
//  TUIWeatherManager.m
//  Radar
//
//  Created by Diego Lafuente on 27/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIWeatherManager.h"
// Models
#import "TUISettings.h"

@implementation TUIWeatherManager

+ (NSString *)currentWeather
{
    return [TUISettings currentSettings].weather;
}

@end
