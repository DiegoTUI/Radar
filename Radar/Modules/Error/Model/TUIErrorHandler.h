//
//  TUIErrorHandler.h
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"

/**
 TUIErrorHandler is the error handler class of the app
 screens
 */
@interface TUIErrorHandler : TUIBaseModel

/**
 @methodName sharedInstance
 @abstract Returns the unique instance of the error handler
 @discussion This method returns the unique instance of the TUIErrorHandler
 
 @return The unique instance of TUIErrorHandler
 */
+ (TUIErrorHandler *)sharedInstance;

/**
 @methodName handleError:completion:
 @abstract Handles an error calling completion when finished
 @discussion This method handles a certain error, normally by showing a UIAlertView,
 and notifies the delegate when finished (normally when the user dismisses the UIAlertView)
 
 @param error The error to handle
 @param completion Block called when the error has been handled
 */
- (void)handleError:(NSError *)error
         completion:(void(^)(NSError *handledError))completion;


@end
