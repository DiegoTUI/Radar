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

static NSMutableSet *spotListURLs;

@implementation TUISpotList (Proxy)


#pragma mark - Requests -

+ (void)spotsForLatitude:(CGFloat)latitude
               longitude:(CGFloat)longitude
                  radius:(CGFloat)radius
              completion:(void(^)(TUISpotList *spotList))completion
                 failure:(void(^)(NSError *error))failure
{
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
