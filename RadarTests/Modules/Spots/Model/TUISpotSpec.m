//
//  TUISpotSpec.m
//  laterooms
//
//  Created by Alex Fish on 8/14/13.
//  Copyright 2013 ustwo. All rights reserved.
//

#import "Kiwi.h"

#import "TUISpot.h"

SPEC_BEGIN(TUISpotSpec)

__block TUISpot *hotel;

beforeAll(^{
    hotel = [[TUISpot alloc] init];
});

describe(@"TUISpot", ^{
    it(@"shoudld subclass TUIBaseModel", ^{
        [[TUISpot should] beSubclassOfClass:[TUIBaseModel class]];
    });
    
    it(@"should have an id", ^{
        [[hotel should] respondToSelector:@selector(_id)];
    });
    
    it(@"should have a name", ^{
        [[hotel should] respondToSelector:@selector(name)];
    });
    
    it(@"should have a description body", ^{
        [[hotel should] respondToSelector:@selector(descriptionBody)];
    });
    
    it(@"should have a location", ^{
        [[hotel should] respondToSelector:@selector(location)];
    });
    
    it(@"should have images", ^{
        [[hotel should] respondToSelector:@selector(imageURLs)];
    });
});

SPEC_END