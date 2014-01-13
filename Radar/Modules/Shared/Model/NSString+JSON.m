//
//  NSString+JSON.m
//  Radar
//
//  Created by Diego Lafuente on 21/10/13.
//  Copyright (c) 2014 TUI Travel A&D. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)

- (NSDictionary *)JSONDictionary
{
    NSError *error;
    
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData: [self dataUsingEncoding:NSUTF8StringEncoding]
                                    options: NSJSONReadingMutableContainers
                                      error: &error];
    if (error)
    {
        return nil;
    }
    
    return JSONDictionary;
}

@end
