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

__block TUIAtlasTicket *spot;

beforeAll(^{
    spot = [[TUIAtlasTicket alloc] init];
});

describe(@"TUIAtlasTicket", ^{
    it(@"shoudld subclass TUISpot", ^{
        [[TUIAtlasTicket should] beSubclassOfClass:[TUISpot class]];
    });
    
    it(@"should have an indoor flag", ^{
        [[spot should] respondToSelector:@selector(indoor)];
    });
    
    it(@"should have a morning flag", ^{
        [[spot should] respondToSelector:@selector(morning)];
    });
    
    it(@"should have an afternoon flag", ^{
        [[spot should] respondToSelector:@selector(afternoon)];
    });
    
    it(@"should have an evening flag", ^{
        [[spot should] respondToSelector:@selector(evening)];
    });
    
    it(@"should have a full day flag", ^{
        [[spot should] respondToSelector:@selector(fullday)];
    });
    
});

SPEC_END