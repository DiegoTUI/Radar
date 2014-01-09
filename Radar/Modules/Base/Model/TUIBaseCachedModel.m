//
//  TUIBaseCachedModel.m
//  Radar
//
//  Created by Diego Lafuente on 09/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseCachedModel.h"

@implementation TUIBaseCachedModel

#pragma mark - Expiration

- (BOOL)isExpired
{
    return NO;
}

#pragma mark - Serializing

- (NSDictionary *)dictionary
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)] userInfo:nil];
}

#pragma mark - Parsing

+ (TUIBaseCachedModel *)objectFromDictionary:(NSDictionary *)dictionary
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}


@end
