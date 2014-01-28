//
//  TUIUserLocationSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUIUserLocation.h"

SPEC_BEGIN(TUIUserLocationSpec)

__block TUIUserLocation *location;

beforeAll(^{
    location = [[TUIUserLocation alloc] init];
});

describe(@"TUIUserLocation", ^{
    it(@"shoudld subclass TUIBaseModel", ^{
        [[TUIUserLocation should] beSubclassOfClass:[TUIBaseModel class]];
    });
    
    it(@"should have a coordinate", ^{
        [[location should] respondToSelector:@selector(coordinate)];
    });
    
    
    it(@"should retrieve the default user location", ^{
        location = [TUIUserLocation defaultUserLocation];
        [[@(location.coordinate.latitude) should] equal:theValue(DEFAULT_LATITUDE)];
        [[@(location.coordinate.longitude) should] equal:theValue(DEFAULT_LONGITUDE)];
    });
});

SPEC_END