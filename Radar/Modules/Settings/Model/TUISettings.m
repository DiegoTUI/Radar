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

- (id)init
{
    self = [super init];
    if (self)
    {
        [self setDefaultSettings];
    }
    return self;
}

- (id)initWithCache
{
    self = [super init];
    if (self)
    {
        // try to read the settings from the cache
        TUISettings *settings = (TUISettings *)[TUICache readObjectOfClass:[TUISettings class] forKey:CACHED_SETTINGS_KEY];
        if (settings)
        {
            self = settings;
        }
        else
        {
            [self setDefaultSettings];
        }
        
    }
    return self;
}

- (void)setDefaultSettings
{
    self.weather = DEFAULT_WEATHER;
    self.autolocation = [NSNumber numberWithBool:DEFAULT_AUTOLOCATION];
    self.latitude = [NSNumber numberWithDouble:DEFAULT_LATITUDE];
    self.longitude = [NSNumber numberWithDouble:DEFAULT_LONGITUDE];
    self.autotime = [NSNumber numberWithBool:DEFAULT_AUTOTIME];
    self.time = DEFAULT_TIME;
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

@end
