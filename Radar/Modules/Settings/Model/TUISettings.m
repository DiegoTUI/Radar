//
//  TUISettings.m
//  Radar
//
//  Created by Diego Lafuente on 09/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISettings.h"
// Models
#import "TUICache.h"

@interface TUISettings()

@end

@implementation TUISettings


#pragma mark - Init -

+ (TUISettings *)cachedSettings;
{
    return (TUISettings *)[TUICache readObjectOfClass:[TUISettings class] forKey:CACHED_SETTINGS_KEY];
}

+ (TUISettings *)defaultSettings
{
    TUISettings *result = [[TUISettings alloc] init];
    
    result.weather = DEFAULT_WEATHER;
    result.autolocation = [NSNumber numberWithBool:DEFAULT_AUTOLOCATION];
    result.latitude = [NSNumber numberWithDouble:DEFAULT_LATITUDE];
    result.longitude = [NSNumber numberWithDouble:DEFAULT_LONGITUDE];
    result.autotime = [NSNumber numberWithBool:DEFAULT_AUTOTIME];
    result.time = DEFAULT_TIME;
    
    return result;
}

+ (TUISettings *)currentSettings
{
    TUISettings *currentSettings = [TUISettings cachedSettings] == nil ? [TUISettings defaultSettings] : [TUISettings cachedSettings];
    
    return currentSettings;
}


#pragma mark - Persist -

- (void)persist
{
    [TUICache storeObject:self forKey:CACHED_SETTINGS_KEY];
}


#pragma mark - Serializing -

- (NSDictionary *)dictionary
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    if (_weather)
    {
        [result setValue:_weather forKey:@"weather"];
    }
    if (_autolocation)
    {
        [result setValue:_autolocation forKey:@"autolocation"];
    }
    if (_latitude)
    {
        [result setValue:_latitude forKey:@"latitude"];
    }
    if (_longitude)
    {
        [result setValue:_longitude forKey:@"longitude"];
    }
    if (_autotime)
    {
        [result setValue:_autotime forKey:@"autotime"];
    }
    if (_time)
    {
        [result setValue:_time forKey:@"time"];
    }
    return result;
}


#pragma mark - Parsing -

+ (TUIBaseModel<TUISerializable> *)objectFromDictionary:(NSDictionary *)dictionary
{
    NSString *weather = [dictionary objectForKey:@"weather"];
    NSNumber *autolocation = [dictionary objectForKey:@"autolocation"];
    NSNumber *latitude = [dictionary objectForKey:@"latitude"];
    NSNumber *longitude = [dictionary objectForKey:@"longitude"];
    NSNumber *autotime = [dictionary objectForKey:@"autotime"];
    NSString *time = [dictionary objectForKey:@"time"];
    
    TUISettings *result = [[TUISettings alloc] init];
    
    if (weather)
    {
        result.weather = weather;
    }
    if (autolocation)
    {
        result.autolocation = autolocation;
    }
    if (latitude)
    {
        result.latitude = latitude;
    }
    if (longitude)
    {
        result.longitude = longitude;
    }
    if (autotime)
    {
        result.autotime = autotime;
    }
    if (time)
    {
        result.time = time;
    }
    
    return result;
}


#pragma mark - Description

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%p> Weather:%@, Autolocation: %@, Latitude: %@, Longitude: %@, Autotime: %@, Time: %@",
            self,
            self.weather,
            self.autolocation,
            self.latitude,
            self.longitude,
            self.autotime,
            self.time];
}

@end
