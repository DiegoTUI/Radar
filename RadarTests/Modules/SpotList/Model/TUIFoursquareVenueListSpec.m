//
//  TUIFoursquareVenueListSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUIFoursquareVenueList.h"

SPEC_BEGIN(TUIFoursquareVenueListSpec)

describe(@"TUIFoursquareVenueList", ^{
    
    it(@"shoudld subclass TUISpotList", ^{
        [[TUIFoursquareVenueList should] beSubclassOfClass:[TUISpotList class]];
    });
});

SPEC_END