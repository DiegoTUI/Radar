//
//  TUISpotListParserSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUISpotList.h"
#import "TUISpotListParser.h"
#import "TUIAtlasTicket.h"
#import "TUIFoursquareVenue.h"

SPEC_BEGIN(TUISpotListParserSpec)

describe(@"TUISpotListParser", ^{
    
    __block NSArray *mockResponse;
    
    beforeAll(^{
        mockResponse = @[@{@"name": @"testname",
                         @"code": @"testcode",
                         @"type": @"foursquare",
                         @"longitude": @(2),
                         @"latitude": @(4)},
                         @{@"name": @"testname",
                           @"code": @"testcode",
                           @"type": @"atlas",
                           @"description": @"testdescription",
                           @"imageUrl": @"testImageUrl",
                           @"longitude": @(2),
                           @"latitude": @(4),
                           @"indoor": @(true),
                           @"morning": @(false),
                           @"afternoon": @(false),
                           @"evening": @(true),
                           @"fullday": @(true)}];
    });
    
    it(@"should conform to the LRParser protocol", ^{
        [[TUISpotListParser should] conformToProtocol:@protocol(TUIParser)];
    });
    
    describe(@"When parsing", ^{
        
        __block TUISpotList *spotList = nil;
        
        beforeEach(^{
            spotList = (TUISpotList *)[TUISpotListParser objectFromResponse:mockResponse];
        });
        
        it(@"should return nil for an invalid response", ^{
            [[[TUISpotListParser objectFromResponse:@{}] should] beNil];
        });
        
        it(@"should return an spotList object", ^{
            [[spotList shouldNot] beNil];
        });
        
        it(@"should parse the two objects correctly", ^{
            [[@(spotList.spots.count) should] equal:@(mockResponse.count)];
            [[@([spotList.spots[0] isKindOfClass:[TUIFoursquareVenue class]]) should] beTrue];
            [[@([spotList.spots[1] isKindOfClass:[TUIAtlasTicket class]]) should] beTrue];
        });
    });
    
});

SPEC_END