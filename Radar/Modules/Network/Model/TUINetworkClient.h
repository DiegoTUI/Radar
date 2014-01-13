//
//  TUINetworkClient.h
//  Radar
//
//  Created by Diego Lafuente on 10/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TUIBaseModel.h"

/**
 The internet media type to use
 */
typedef NS_ENUM(NSInteger, TUIInternetMediaType)
{
    /** No internet media type */
    TUIInternetMediaTypeNone = 0,
    /** Form encoded data */
    TUIInternetMediaTypeFormEncodedData,
    /** JSON data */
    TUIInternetMediaTypeJSON
};

/**
 TUINetworkClient is a singleton class which performs the network calls
 */
@interface TUINetworkClient : TUIBaseModel

/**
 @methodName sharedClient
 @abstract A singleton instance of the TUINetworkClient
 @discussion This method will return a singleton class of the TUINetworkClient which
 is in charge of making HTTP calls
 
 @return The singleton instance of TUINetworkClient
 */
+ (TUINetworkClient *)sharedClient;

/**
 @methodName requestWithURL:usingMethod:withBody:andInternetMediaType:authenticated:completion:
 @abstract Sends a POST request
 @discussion This method will send a POST request to a specified URL with the supplied body and return a success or failure paramter
 in a completion block.
 
 @param URL the URL to request
 @param method the method to use
 @param body the body to send
 @param type The internet media type to set to the header
 @param authenticated A BOOL indicating if the request required authentication
 @param completion The completion block, can succeed/fail
 */
- (void)requestWithURL:(NSURL *)URL
           usingMethod:(NSString *)method
              withBody:(NSString *)body
  andInternetMediaType:(TUIInternetMediaType)type
         authenticated:(BOOL)authenticated
            completion:(void(^)(id response, NSDictionary *responseHeaders, NSError *error))completion;


@end
