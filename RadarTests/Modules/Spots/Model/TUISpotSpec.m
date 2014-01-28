//
//  TUISpotSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUISpot.h"

SPEC_BEGIN(TUISpotSpec)

__block TUISpot *spot;

beforeAll(^{
    spot = [[TUISpot alloc] init];
});

describe(@"TUISpot", ^{
    it(@"shoudld subclass TUIBaseModel", ^{
        [[TUISpot should] beSubclassOfClass:[TUIBaseModel class]];
    });
    
    it(@"should have an id", ^{
        [[spot should] respondToSelector:@selector(_id)];
    });
    
    it(@"should have a name", ^{
        [[spot should] respondToSelector:@selector(name)];
    });
    
    it(@"should have a description body", ^{
        [[spot should] respondToSelector:@selector(descriptionBody)];
    });
    
    it(@"should have a location", ^{
        [[spot should] respondToSelector:@selector(coordinate)];
    });
    
    it(@"should have images", ^{
        [[spot should] respondToSelector:@selector(imageURLs)];
    });
});

SPEC_END