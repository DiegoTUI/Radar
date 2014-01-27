//
//  NSError+TUIError.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "NSError+TUIError.h"

@implementation NSError (TUIError)

+ (NSError *)errorWithTUIErrorCode:(TUIErrorCode)errorCode
{
    NSString *message = nil;
    NSString *title = nil;
    
    switch (errorCode)
    {
        case TUIErrorCodeNoConnection:
            title = NSLocalizedString(@"ERROR_NO_CONNECTION_TITLE", nil);
            message = NSLocalizedString(@"ERROR_NO_CONNECTION", nil);
            break;
        case TUIErrorCodeTimeout:
            title = NSLocalizedString(@"ERROR_TIMEOUT_TITLE", nil);
            message = NSLocalizedString(@"ERROR_TIMEOUT", nil);
            break;
        default:
            errorCode = TUIErrorCodeGeneric;
            title = NSLocalizedString(@"ERROR_GENERIC_TITLE", nil);
            message = NSLocalizedString(@"ERROR_GENERIC", nil);
            break;
    }
    
    // Build error object
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:title,
                               NSLocalizedFailureReasonErrorKey:message};
    
    // Create error
    NSError *error = [NSError errorWithDomain:EMPTY_STRING code:errorCode userInfo:userInfo];
    
    return error;
}

+ (NSError *)errorWithCode:(NSInteger)errorCode
{
    // offline
    if (errorCode == NETWORK_NO_CONNECTION_ERROR_CODE ||
        errorCode == NETWORK_NO_ROAMING_ERROR_CODE)
    {
        return [NSError errorWithTUIErrorCode:TUIErrorCodeNoConnection];
    }
    // timeout
    if (errorCode == NETWORK_TIMEOUT_ERROR_CODE)
    {
        return [NSError errorWithTUIErrorCode:TUIErrorCodeTimeout];
    }
    // default
    return [NSError errorWithTUIErrorCode:errorCode];
}

@end
