//
//  TUIFoursquareVenueParserSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/14/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUIFoursquareVenue.h"
#import "TUIFoursquareVenueParser.h"

SPEC_BEGIN(TUIFoursquareVenueParserSpec)

describe(@"TUIFoursquareVenueParser", ^{
    
    __block NSDictionary *mockResponse;
    
    beforeAll(^{
        mockResponse = @{@"name": @"testname",
                         @"code": @"testcode",
                         @"type": @"testtype",
                         @"longitude": @(2),
                         @"latitude": @(4)};
    });
    
    it(@"should conform to the LRParser protocol", ^{
        [[TUIFoursquareVenueParser should] conformToProtocol:@protocol(TUIParser)];
    });
    
    describe(@"When parsing", ^{
        
        __block TUIFoursquareVenue *foursquareVenue = nil;
        
        beforeEach(^{
            foursquareVenue = (TUIFoursquareVenue *)[TUIFoursquareVenueParser objectFromResponse:mockResponse];
        });
        
        it(@"should return nil for an invalid response", ^{
            [[[TUIFoursquareVenueParser objectFromResponse:@{}] should] beNil];
        });
        
        it(@"should return an atlas ticket object", ^{
            [[foursquareVenue shouldNot] beNil];
        });
        
        it(@"should parse the ticket name", ^{
            [[foursquareVenue.name shouldNot] beNil];
            [[foursquareVenue.name should] equal:mockResponse[@"name"]];
        });
        
        it(@"should parse the ticket code", ^{
            [[foursquareVenue._id shouldNot] beNil];
            [[foursquareVenue._id should] equal:mockResponse[@"code"]];
        });
        
        it(@"should parse the ticket latitude and longitude", ^{
            [[@(foursquareVenue.coordinate.latitude) should] equal:mockResponse[@"latitude"]];
            [[@(foursquareVenue.coordinate.longitude) should] equal:mockResponse[@"longitude"]];
        });
    });
    
});

SPEC_END