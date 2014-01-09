//
//  TUITestSerializableObject.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 9/17/13.
//  Copyright (c) 2013 TUI Travel A&D. All rights reserved.
//

#import "TUITestSerializableObject.h"

@implementation TUITestSerializableObject

- (NSDictionary *)dictionary
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    if (_property1)
    {
        [result setValue:_property1 forKey:@"property1"];
    }
    if (_property2)
    {
        [result setValue:_property2 forKey:@"property2"];
    }
    return result;
}

+ (TUIBaseModel<TUISerializable> *)objectFromDictionary:(NSDictionary *)dictionary
{
    NSString *property1 = [dictionary objectForKey:@"property1"];
    NSString *property2 = [dictionary objectForKey:@"property2"];
    
    TUITestSerializableObject *result = [[TUITestSerializableObject alloc] init];
    
    if (property1)
    {
        result.property1 = property1;
    }
    if (property2)
    {
        result.property2 = property2;
    }
    
    return result;
}

@end
