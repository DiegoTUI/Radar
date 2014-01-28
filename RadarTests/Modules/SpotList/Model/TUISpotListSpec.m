//
//  TUISpotListSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUISpotList.h"

SPEC_BEGIN(TUISpotListSpec)

__block TUISpotList *spotList;

beforeAll(^{
    spotList = [[TUISpotList alloc] init];
});

describe(@"TUISpotList", ^{
    
    it(@"shoudld subclass TUIBaseModel", ^{
        [[TUISpotList should] beSubclassOfClass:[TUIBaseModel class]];
    });
    
    it(@"should have an empty list of spots", ^{
        [[spotList should] respondToSelector:@selector(spots)];
        [[spotList.spots should] haveCountOf:ZERO_INT];
    });
});

SPEC_END