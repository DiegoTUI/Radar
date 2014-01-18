//
//  TUIAtlasTicketSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUIAtlasTicket.h"

SPEC_BEGIN(TUIAtlasTicketSpec)

describe(@"TUIAtlasTicket", ^{
    it(@"shoudld subclass TUISpot", ^{
        [[TUIAtlasTicket should] beSubclassOfClass:[TUISpot class]];
    });
    
});

SPEC_END