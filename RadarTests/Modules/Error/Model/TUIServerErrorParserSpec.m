//
//  TUIServerErrorParserSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/13/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUIServerErrorParser.h"
#import "TUIServerError.h"


SPEC_BEGIN(TUIServerErrorParserSpec)

describe(@"TUIServerErrorParserSpec", ^{
    
    __block NSDictionary *mockResponse;
    
    beforeAll(^{
        mockResponse = @{@"title": @"Service not found",
                         @"code": @(1001),
                         @"message": @"The requested service fs-venue-search was not found in this server",
                         @"contact": @"dlafuente@tuitravel-ad.com",
                         @"stack": @"teststack"};
    });
    
    it(@"should conform to the TUIParser protocol", ^{
        [[TUIServerErrorParser should] conformToProtocol:@protocol(TUIParser)];
    });
    
    describe(@"When parsing", ^{
        __block TUIServerError *serverError = nil;
        
        beforeEach(^{
            serverError = (TUIServerError *)[TUIServerErrorParser objectFromResponse:mockResponse];
        });
        
        it(@"should return nil for an invalid response", ^{
            [[[TUIServerErrorParser objectFromResponse:@{}] should] beNil];
        });
        
        it(@"should return a server error object", ^{
            [[serverError shouldNot] beNil];
        });
        
        it(@"should parse the title", ^{
            [[serverError.title shouldNot] beNil];
            [[serverError.title should] equal:mockResponse[@"title"]];
        });
        
        it(@"should parse the code", ^{
            [[serverError.code shouldNot] beNil];
            [[serverError.code should] equal:mockResponse[@"code"]];
        });
        
        it(@"should parse the message", ^{
            [[serverError.message shouldNot] beNil];
            [[serverError.message should] equal:mockResponse[@"message"]];
        });
        
    });
    
});

SPEC_END