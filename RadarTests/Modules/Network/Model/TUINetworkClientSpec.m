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
        __block AFHTTPRequestOperationManager *operationManager;
        __block NSOperationQueue *operationQueue;
        __block NSURLRequest *request;
        __block NSError *mockError;
        
        beforeAll(^{
            request = [[NSURLRequest alloc] init];
            requestOperation = [AFHTTPRequestOperation mock];
            operationManager = [AFHTTPRequestOperationManager mock];
            operationQueue = [NSOperationQueue mock];
            [requestOperation stub:@selector(initWithRequest:) andReturn:requestOperation];
            [AFHTTPRequestOperationManager stub:@selector(manager) andReturn:operationManager];
            [operationManager stub:@selector(setResponseSerializer:)];
            [operationManager stub:@selector(operationQueue) andReturn:operationQueue];
            [operationQueue stub:@selector(addOperation:)];
            [AFHTTPRequestOperation stub:@selector(alloc) andReturn:requestOperation];
            [operationManager stub:@selector(HTTPRequestOperationWithRequest:success:failure:) andReturn:requestOperation];
            mockError = [NSError errorWithDomain:@"mockDomain" code:0 userInfo:nil];
            
            requestCompletionSpy = [operationManager captureArgument:@selector(HTTPRequestOperationWithRequest:success:failure:) atIndex:1];
            requestFailureSpy = [operationManager captureArgument:@selector(HTTPRequestOperationWithRequest:success:failure:) atIndex:2];
        });
        
        it(@"should enqueue a new request operation", ^{
            [[operationQueue should] receive:@selector(addOperation:)];
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