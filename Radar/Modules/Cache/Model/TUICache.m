//
//  TUICache.m
//  Radar
//
//  Created by Diego Lafuente on 09/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUICache.h"

@implementation TUICache

#pragma mark - Read

+ (TUIBaseModel<TUISerializable> *)readObjectOfClass:(Class)type
                                            forKey:(NSString *)key
{
    if ([type isSubclassOfClass:[TUIBaseModel class]] &&
        [type conformsToProtocol:@protocol(TUISerializable)])
    {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *serializedObject = [userDefaults stringForKey:key];
        if (serializedObject != nil)
        {
            NSDictionary *jsonObject = [serializedObject JSONDictionary];
            if (jsonObject != nil)
            {
                TUIBaseModel<TUISerializable> *object = [(id)type objectFromDictionary:jsonObject];
                return object;
            }
            
        }
    }
    return nil;
}

#pragma mark - Store

+ (void)storeObject:(TUIBaseModel<TUISerializable> *)object
             forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *serializedObject = [[object dictionary] JSONString];
    [userDefaults setObject:serializedObject forKey:key];
}

#pragma mark - Remove

+ (void)removeObjectForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
}

@end
