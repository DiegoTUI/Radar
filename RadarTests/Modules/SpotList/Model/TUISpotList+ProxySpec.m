//
//  TUISpotList+ProxySpec.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUISpotList+Proxy.h"
#import "TUINetworkClient.h"
#import "TUISpotListParser.h"

SPEC_BEGIN(TUISpotList_ProxySpec)

describe(@"TUISpotList+Proxy", ^{
    
    describe(@"when getting hotels", ^{
        
        __block KWCaptureSpy *completionSpy;
        __block TUISpotList *mockSpotList;
        __block NSDictionary *mockResponse;
        
        beforeEach(^{
            mockSpotList = [[TUISpotList alloc] init];
            mockResponse = [NSDictionary mock];
            
            [TUISpotListParser stub:@selector(objectFromResponse:) andReturn:mockSpotList];
            
            completionSpy = [[TUINetworkClient sharedClient] captureArgument:@selector(requestWithURL:usingMethod:withBody:andInternetMediaType:authenticated:completion:) atIndex:5];
        });
        
        it(@"should return a valid TUISpotList object", ^{
            [TUISpotList spotsForLatitude:0 longitude:0 radius:0 completion:^(TUISpotList *spotList) {
                [[spotList should] equal:mockSpotList];
            } failure:nil];
            
            void *(^complete)(id response, NSDictionary *responseHeaders, NSError *error) = completionSpy.argument;
            complete(mockResponse, nil, nil);
        });
        
        it(@"should return an error if the response is invalid", ^{
            [TUISpotListParser stub:@selector(objectFromResponse:) andReturn:nil];
            
            [TUISpotList spotsForLatitude:0 longitude:0 radius:0 completion:nil failure:^(NSError *error) {
                [[error shouldNot] beNil];
            }];
            
            void *(^complete)(id response, NSDictionary *responseHeaders, NSError *error) = completionSpy.argument;
            complete(mockResponse, nil, nil);
        });
        
        it(@"should return an NSError when failing", ^{
            [TUISpotList spotsForLatitude:0 longitude:0 radius:0 completion:nil failure:^(NSError *error) {
                [[error shouldNot] beNil];
            }];
            
            void *(^complete)(id response, NSDictionary *responseHeaders, NSError *error) = completionSpy.argument;
            complete(nil, nil, [NSError mock]);
        });
    });
});

SPEC_END