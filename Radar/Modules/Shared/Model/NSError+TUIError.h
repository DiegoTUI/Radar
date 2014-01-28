//
//  NSError+TUIError.h
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

/**
 LRError codes
 */
typedef NS_ENUM(NSInteger, TUIErrorCode)
{
    /** Generic error code */
    TUIErrorCodeGeneric,
    /** No connection */
    TUIErrorCodeNoConnection,
    /** Clien-side timeout */
    TUIErrorCodeTimeout
};

/**
 NSError+TUIError helps the app to handle errors
 */
@interface NSError (TUIError)

/**
 @methodName errorWithCode:
 @abstract Returns a TUI NSError object
 @discussion This method will create and return a NSError object depending on which error code
 is passed to the method
 
 @param errorCode The error code to create an NSError for
 @return An NSError error
 */
+ (NSError *)errorWithCode:(NSInteger)errorCode;

@end
