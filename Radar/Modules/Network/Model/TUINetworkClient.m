//
//  TUINetworkClient.m
//  Radar
//
//  Created by Diego Lafuente on 10/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUINetworkClient.h"
#import "AFNetworking.h"
// Extensions
#import "TUINetworkClient_Private.h"
// Models
#import "TUIServerError.h"
#import "TUIServerErrorParser.h"

static NSString *kLRHTTPHeaderContentType       = @"Content-Type";
static NSString *kLRHTTPHeaderContentTypeValue  = @"application/json";

@implementation TUINetworkClient


#pragma mark - Singleton

+ (id)sharedClient
{
    static dispatch_once_t onceToken = 0;
    __strong static TUINetworkClient *_sharedObject = nil;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[TUINetworkClient alloc] init];
    });
    return _sharedObject;
}


#pragma mark - Request

- (void)sendRequest:(NSURLRequest *)request
         completion:(void(^)(id response, NSDictionary *responseHeaders, NSError *error))completion
{
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                         initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(completion)
        {
            completion(responseObject, operation.response.allHeaderFields, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(completion)
        {
            TUIServerError *serverError = nil;
            if (operation.responseString)
            {
                serverError = (TUIServerError *)[TUIServerErrorParser objectFromResponse:[operation.responseString JSONDictionary]];
            }
            NSMutableDictionary *mutableUserInfo = error.userInfo ? [error.userInfo mutableCopy] : [NSMutableDictionary dictionary];
            [mutableUserInfo setValue:[NSNumber numberWithInteger:operation.response.statusCode] forKey:@"HTTPStatusCode"];
            completion(nil, operation.response.allHeaderFields, [NSError errorWithDomain:error.domain
                                                                                    code:error.code
                                                                                userInfo:mutableUserInfo]);
        }
    }];
    
    [operation start];
}

#pragma mark - HTTP calls

- (void)requestWithURL:(NSURL *)URL
           usingMethod:(NSString *)method
              withBody:(NSString *)body
  andInternetMediaType:(TUIInternetMediaType)type
         authenticated:(BOOL)authenticated
            completion:(void(^)(id response, NSDictionary *responseHeaders, NSError *error))completion
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    
    // Set up request
    [request setHTTPMethod:(method == nil ? POST_REQUEST_METHOD : method)];
    if (body != nil)
    {
        [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        [request setValue:kLRHTTPHeaderContentTypeValue forHTTPHeaderField:kLRHTTPHeaderContentType];
    }
    // Add timeout
    [request setTimeoutInterval:NETWORK_TIMEOUT];
    // Set internet media type to request
    if (type > TUIInternetMediaTypeNone)
    {
        NSString *typeString = [self stringFromInternetMediaType:type];
        [request setValue:typeString forHTTPHeaderField:kLRHTTPHeaderContentType];
    }
    
    [self sendRequest:request completion:^(id response, NSDictionary *responseHeaders, NSError *error)
     {
         if(completion)
         {
             completion(response, responseHeaders, error);
         }
     }];
}


#pragma mark - Internet media types

- (NSString *)stringFromInternetMediaType:(TUIInternetMediaType)type
{
    switch (type)
    {
        case TUIInternetMediaTypeFormEncodedData:
            return @"application/x-www-form-urlencoded";
        case TUIInternetMediaTypeJSON:
            return @"application/json";
        default:
            return nil;
    }
}

@end
