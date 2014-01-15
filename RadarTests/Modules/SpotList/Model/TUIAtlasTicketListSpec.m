//
//  TUIAtlasTicketListSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUIAtlasTicketList.h"

SPEC_BEGIN(TUIAtlasTicketListSpec)

describe(@"TUIAtlasTicketList", ^{
    
    it(@"shoudld subclass TUISpotList", ^{
        [[TUIAtlasTicketList should] beSubclassOfClass:[TUISpotList class]];
    });
});

SPEC_END