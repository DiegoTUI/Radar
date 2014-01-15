//
//  TUIFoursquareVenueSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUIFoursquareVenue.h"

SPEC_BEGIN(TUIFoursquareVenueSpec)

describe(@"TUIFoursquareVenue", ^{
    it(@"shoudld subclass TUISpot", ^{
        [[TUIFoursquareVenue should] beSubclassOfClass:[TUISpot class]];
    });
    
});

SPEC_END