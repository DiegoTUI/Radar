//
//  TUIAtlasTicketParserSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUIAtlasTicket.h"
#import "TUIAtlasTicketParser.h"

SPEC_BEGIN(TUIAtlasTicketParserSpec)

describe(@"TUIAtlasTicketParser", ^{
    
    __block NSDictionary *mockResponse;
    
    beforeAll(^{
        mockResponse = @{@"name": @"testname",
                         @"code": @"testcode",
                         @"type": @"testtype",
                         @"description": @"testdescription",
                         @"imageUrl": @"testImageUrl",
                         @"longitude": @(2),
                         @"latitude": @(4),
                         @"indoor": @(true),
                         @"morning": @(false),
                         @"afternoon": @(false),
                         @"evening": @(true),
                         @"fullday": @(true)};
    });
    
    it(@"should conform to the LRParser protocol", ^{
        [[TUIAtlasTicketParser should] conformToProtocol:@protocol(TUIParser)];
    });
    
    describe(@"When parsing", ^{
        
        __block TUIAtlasTicket *atlasTicket = nil;
        
        beforeEach(^{
            atlasTicket = (TUIAtlasTicket *)[TUIAtlasTicketParser objectFromResponse:mockResponse];
        });
        
        it(@"should return nil for an invalid response", ^{
            [[[TUIAtlasTicketParser objectFromResponse:@{}] should] beNil];
        });
        
        it(@"should return an atlas ticket object", ^{
            [[atlasTicket shouldNot] beNil];
        });
        
        it(@"should parse the ticket name", ^{
            [[atlasTicket.name shouldNot] beNil];
            [[atlasTicket.name should] equal:mockResponse[@"name"]];
        });
        
        it(@"should parse the ticket code", ^{
            [[atlasTicket._id shouldNot] beNil];
            [[atlasTicket._id should] equal:mockResponse[@"code"]];
        });
        
        it(@"should parse the ticket description", ^{
            [[atlasTicket.descriptionBody shouldNot] beNil];
            [[atlasTicket.descriptionBody should] equal:mockResponse[@"description"]];
        });
        
        it(@"should parse the ticket imageUrl", ^{
            [[atlasTicket.imageURLs shouldNot] beNil];
            [[atlasTicket.imageURLs[0] should] equal:mockResponse[@"imageUrl"]];
        });
        
        it(@"should parse the ticket latitude and longitude", ^{
            [[atlasTicket.location shouldNot] beNil];
            [[@(atlasTicket.location.coordinate.latitude) should] equal:mockResponse[@"latitude"]];
            [[@(atlasTicket.location.coordinate.longitude) should] equal:mockResponse[@"longitude"]];
        });
        
        it(@"should parse the ticket indoor flag", ^{
            [[atlasTicket.indoor shouldNot] beNil];
            [[atlasTicket.indoor should] equal:mockResponse[@"indoor"]];
        });
        
        it(@"should parse the ticket morning flag", ^{
            [[atlasTicket.morning shouldNot] beNil];
            [[atlasTicket.morning should] equal:mockResponse[@"morning"]];
        });
        
        it(@"should parse the ticket afternoon flag", ^{
            [[atlasTicket.afternoon shouldNot] beNil];
            [[atlasTicket.afternoon should] equal:mockResponse[@"afternoon"]];
        });
        
        it(@"should parse the ticket evening flag", ^{
            [[atlasTicket.evening shouldNot] beNil];
            [[atlasTicket.evening should] equal:mockResponse[@"evening"]];
        });
        
        it(@"should parse the ticket full day flag", ^{
            [[atlasTicket.fullday shouldNot] beNil];
            [[atlasTicket.fullday should] equal:mockResponse[@"fullday"]];
        });
    });
    
});

SPEC_END