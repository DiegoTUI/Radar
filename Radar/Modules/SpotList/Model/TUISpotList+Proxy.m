//
//  TUISpotList+Proxy.m
//  Radar
//
//  Created by Diego Lafuente on 21/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotList+Proxy.h"
// Models
#import "TUINetworkClient.h"
#import "TUISpotList.h"
#import "TUISpotListParser.h"

static NSMutableSet *spotListURLs;

@implementation TUISpotList (Proxy)


#pragma mark - Requests -

+ (void)spotsForLatitude:(double)latitude
               longitude:(double)longitude
                  radius:(NSInteger)radius
              completion:(void(^)(TUISpotList *spotList))completion
                 failure:(void(^)(NSError *error))failure
{
    NSURL *url = [NSURL spotListURL:latitude longitude:longitude radius:radius];
    
    if (!spotListURLs)
    {
        spotListURLs = [NSMutableSet set];
    }
    
    if(url)
    {
        [spotListURLs addObject:url];
    }
    
    TUINetworkClient *networkClient = [TUINetworkClient sharedClient];
    
    [networkClient requestWithURL:url
                      usingMethod:GET_REQUEST_METHOD
                         withBody:Nil
             andInternetMediaType:TUIInternetMediaTypeNone
                    authenticated:NO
                       completion:^(id response, NSDictionary *responseHeaders, NSError *error) {
                           
                           if(url)
                           {
                               [spotListURLs removeObject:url];
                           }
                           
                           if(!error)
                           {
                               TUISpotList *spotList = (TUISpotList *)[TUISpotListParser objectFromResponse:response];
                               if(spotList)
                               {
                                   if(completion)
                                   {
                                       completion(spotList);
                                   }
                               }
                               else
                               {
                                   failure([NSError errorWithCode:TUIErrorCodeGeneric]);
                               }
                           }
                           else
                           {
                               if(failure)
                               {
                                   failure(error);
                               }
                           }
    }];
}


#pragma mark - Cancellation -

+ (void)cancelNetworkRequests
{
    for(NSURL *url in spotListURLs)
    {
        NSString *path = [url path];
        [[TUINetworkClient sharedClient] cancelAllHTTPOperationsWithMethod:GET_REQUEST_METHOD path:path];
    }
    
    [spotListURLs removeAllObjects];
}

@end
