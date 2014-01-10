//
//  TuiSettingsSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/9/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUISettings.h"
#import "TUICache.h"

SPEC_BEGIN(TUISettingsSpec)

__block TUISettings *settings;

describe(@"TUISettings", ^{
    
    beforeAll(^{
        settings = [[TUISettings alloc] init];
    });
    
    it(@"should subclass LRBaseCachedModel", ^{
        [[TUISettings should] beSubclassOfClass:[TUIBaseCachedModel class]];
    });
    
    it(@"should have an weather", ^{
        [[settings should] respondToSelector:@selector(weather)];
    });
    
    it(@"should have a autolocation", ^{
        [[settings should] respondToSelector:@selector(autolocation)];
    });
    
    it(@"should have a latitude", ^{
        [[settings should] respondToSelector:@selector(latitude)];
    });
    
    it(@"should have a longitude", ^{
        [[settings should] respondToSelector:@selector(longitude)];
    });
    
    it(@"should have a autotime", ^{
        [[settings should] respondToSelector:@selector(autotime)];
    });
    
    it(@"should have a time", ^{
        [[settings should] respondToSelector:@selector(time)];
    });
});

describe(@"When calling init", ^{
    
    beforeEach(^{
        settings = [[TUISettings alloc] init];
    });
    
    it(@"should create an empty object", ^{
        [[settings.weather should] beNil];
        [[settings.autolocation should] beNil];
        [[settings.latitude should] beNil];
        [[settings.longitude should] beNil];
        [[settings.autotime should] beNil];
        [[settings.time should] beNil];
    });
});

describe(@"When calling defaultSettings", ^{
    
    beforeEach(^{
        settings = [TUISettings defaultSettings];
    });
    
    it(@"should create an default object", ^{
        [[settings.weather should] equal:DEFAULT_WEATHER];
        [[settings.autolocation should] equal:[NSNumber numberWithBool:DEFAULT_AUTOLOCATION]];
        [[settings.latitude should] equal:[NSNumber numberWithDouble:DEFAULT_LATITUDE]];
        [[settings.longitude should] equal:[NSNumber numberWithDouble:DEFAULT_LONGITUDE]];
        [[settings.autotime should] equal:[NSNumber numberWithBool:DEFAULT_AUTOTIME]];
        [[settings.time should] equal:DEFAULT_TIME];
    });
});

describe(@"When calling cachedSettings", ^{
    
    it(@"should return the cached object", ^{
        TUISettings *mockSettings = [TUISettings mock];
        [TUICache stub:@selector(readObjectOfClass:forKey:) andReturn:mockSettings];
        settings = [TUISettings cachedSettings];
        [[settings should] equal:mockSettings];
    });
});

describe(@"When serializing", ^{
    
    beforeEach(^{
        settings = [TUISettings defaultSettings];
    });
    
    it(@"should create the right dictionary", ^{
        NSDictionary *serialized = [settings dictionary];
        [[serialized[@"weather"] should] equal:DEFAULT_WEATHER];
        [[serialized[@"autolocation"] should] equal:[NSNumber numberWithBool:DEFAULT_AUTOLOCATION]];
        [[serialized[@"latitude"] should] equal:[NSNumber numberWithDouble:DEFAULT_LATITUDE]];
        [[serialized[@"longitude"] should] equal:[NSNumber numberWithDouble:DEFAULT_LONGITUDE]];
        [[serialized[@"autotime"] should] equal:[NSNumber numberWithBool:DEFAULT_AUTOTIME]];
        [[serialized[@"time"] should] equal:DEFAULT_TIME];
    });
});

describe(@"When parsing", ^{
    
    __block NSDictionary *serialized;
    
    beforeEach(^{
        serialized = @{@"weather": @"testweather",
                       @"autolocation": @(YES),
                       @"time": @"testtime",
                       @"holy": @"crap"};
    });
    
    it(@"should parse the object correctly", ^{
        settings = (TUISettings *)[TUISettings objectFromDictionary:serialized];
        [[settings.weather should] equal:serialized[@"weather"]];
        [[settings.autolocation should] equal:serialized[@"autolocation"]];
        [[settings.latitude should] beNil];
        [[settings.longitude should] beNil];
        [[settings.autotime should] beNil];
        [[settings.time should] equal:serialized[@"time"]];
    });
});

SPEC_END