//
//  TUILocationSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUILocation.h"

SPEC_BEGIN(TUILocationSpec)

__block TUILocation *location;

beforeAll(^{
    location = [[TUILocation alloc] init];
});

describe(@"TUILocation", ^{
    it(@"shoudld subclass TUIBaseModel", ^{
        [[TUILocation should] beSubclassOfClass:[TUIBaseModel class]];
    });
    
    it(@"should have a latitude", ^{
        [[location should] respondToSelector:@selector(latitude)];
    });
    
    it(@"should have a longitude", ^{
        [[location should] respondToSelector:@selector(longitude)];
    });
    
    it(@"should retrieve the default user location", ^{
        location = [TUILocation defaultUserLocation];
        [[location.latitude should] equal:theValue(DEFAULT_LATITUDE)];
        [[location.longitude should] equal:theValue(DEFAULT_LONGITUDE)];
    });
});

SPEC_END