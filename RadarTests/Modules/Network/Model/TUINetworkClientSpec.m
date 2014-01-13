//
//  TUIClientSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/13/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUINetworkClient.h"
#import "TUINetworkClient_Private.h"
#import "AFNetworking.h"

SPEC_BEGIN(TUINetworkClientSpec)

describe(@"TUINetworkClient", ^{
    
    it(@"should be a singleton", ^{
        [[TUINetworkClient should] respondToSelector:@selector(sharedClient)];
    });
    
    describe(@"when sending requests", ^{
        
        __block KWCaptureSpy *requestCompletionSpy;
        __block KWCaptureSpy *requestFailureSpy;
        __block AFHTTPRequestOperation *requestOperation;
        __block NSURLRequest *request;
        __block NSError *mockError;
        
        beforeEach(^{
            request = [[NSURLRequest alloc] init];
            requestOperation = [AFHTTPRequestOperation mock];
            [AFHTTPRequestOperation stub:@selector(alloc) andReturn:requestOperation];
            [requestOperation stub:@selector(initWithRequest:) andReturn:requestOperation];
            [requestOperation stub:@selector(setResponseSerializer:)];
            [requestOperation stub:@selector(start)];
            mockError = [NSError errorWithDomain:@"mockDomain" code:0 userInfo:nil];
            
            requestCompletionSpy = [requestOperation captureArgument:@selector(setCompletionBlockWithSuccess:failure:) atIndex:0];
            requestFailureSpy = [requestOperation captureArgument:@selector(setCompletionBlockWithSuccess:failure:) atIndex:1];
        });
        
        it(@"should enqueue a new request operation", ^{
            [[requestOperation should] receive:@selector(start)];
            [[TUINetworkClient sharedClient] sendRequest:request completion:nil];
        });
        
        it(@"should complete with a response if successful", ^{
            [[TUINetworkClient sharedClient] sendRequest:request completion:^(id response, NSDictionary *responseHeaders, NSError *error) {
                [[response shouldNot] beNil];
            }];
            
            void (^completion)(AFHTTPRequestOperation *operation, id responseObject) = requestCompletionSpy.argument;
            completion(nil, @[@"Hello"]);
        });
        
        it(@"should fail with an error if unsuccessful", ^{
            [[TUINetworkClient sharedClient] sendRequest:request completion:^(id response, NSDictionary *responseHeaders, NSError *error) {
                [[error shouldNot] beNil];
            }];
            
            void (^failure)(AFHTTPRequestOperation *operation, NSError *error) = requestFailureSpy.argument;
            failure(nil, mockError);
        });
    });
    
    describe(@"when sending get or post requests", ^{
        
        __block KWCaptureSpy *completionSpy;
        __block NSURL *testURL = [NSURL URLWithString:@"http://google.com"];
        __block NSError *mockError;
        
        beforeEach(^{
            completionSpy = [[TUINetworkClient sharedClient] captureArgument:@selector(sendRequest:completion:) atIndex:1];
            mockError = [NSError errorWithDomain:@"mockDomain" code:0 userInfo:nil];
        });
        
        it(@"should send the request", ^{
            [[[TUINetworkClient sharedClient] should] receive:@selector(sendRequest:completion:)];
            [[TUINetworkClient sharedClient] requestWithURL:testURL usingMethod:POST_REQUEST_METHOD withBody:nil andInternetMediaType:TUIInternetMediaTypeNone authenticated:NO completion:nil];
        });
        
        it(@"should return a response if successful", ^{
            [[TUINetworkClient sharedClient] requestWithURL:testURL usingMethod:POST_REQUEST_METHOD withBody:@"body" andInternetMediaType:TUIInternetMediaTypeNone authenticated:NO completion:^(id response, NSDictionary *responseHeaders, NSError *error) {
                [[response should] equal:@[@"Hello"]];
            }];
            
            void (^completion)(id response, NSDictionary *responseHeaders, NSError *error) = completionSpy.argument;
            completion(@[@"Hello"], @{}, nil);
        });
        
        it(@"should return an error if unsuccessful", ^{
            [[TUINetworkClient sharedClient] requestWithURL:testURL usingMethod:POST_REQUEST_METHOD withBody:@"body" andInternetMediaType:TUIInternetMediaTypeNone authenticated:NO completion:^(id response, NSDictionary *responseHeaders, NSError *error) {
                [[error should] beNonNil];
            }];
            
            void (^completion)(id response, NSDictionary *responseHeaders, NSError *error) = completionSpy.argument;
            completion(nil, nil, mockError);
        });
    });
});

SPEC_END