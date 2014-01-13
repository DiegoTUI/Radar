//
//  TUINetworkClient_Private.h
//  Radar
//
//  Created by Diego Lafuente on 13/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUINetworkClient.h"

/**
 A TUINetworkCLient class extention which exposes some private methods
 */
@interface TUINetworkClient ()

/**
 @methodName sendRequest:completion:
 @abstract Sends a request to the API
 @discussion This method will send a request to the API and respond with a completion block, containing the response when
 succesfull and an error when unsuccesfull
 
 @param request The request object to send
 @param completion The completion block called on compleition or failure
 */
- (void)sendRequest:(NSURLRequest *)request
         completion:(void(^)(id response, NSDictionary *responseHeaders, NSError *error))completion;

@end
