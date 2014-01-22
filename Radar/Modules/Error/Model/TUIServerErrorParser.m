//
//  TUIServerErrorParser.m
//  Radar
//
//  Created by Diego Lafuente on 13/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIServerErrorParser.h"
#import "TUIServerError.h"


@implementation TUIServerErrorParser


#pragma mark - Parsing

+ (TUIServerError *)objectFromResponse:(id)response
{
    TUIServerError *serverError = nil;
    
    if([TUIServerErrorParser responseIsValid:response])
    {
        serverError = [[TUIServerError alloc] init];
        
        serverError.title = response[@"title"];
        serverError.code = response[@"code"];
        serverError.message = response[@"message"];
    }
    
    return serverError;
}


#pragma mark - Validation

+ (BOOL)responseIsValid:(id)response
{
    BOOL isValid = NO;
    
    if([response isKindOfClass:[NSDictionary class]] &&
       [response objectForKey:@"title"] &&
       [response objectForKey:@"code"] &&
       [response objectForKey:@"message"] &&
       [response[@"title"] isKindOfClass:[NSString class]] &&
       [response[@"code"] isKindOfClass:[NSNumber class]] &&
       [response[@"message"] isKindOfClass:[NSString class]])
    {
        isValid = YES;
    }
    
    return isValid;
}

@end
