//
//  NSString+JSON.h
//  Radar
//
//  Created by Diego Lafuente on 21/10/13.
//  Copyright (c) 2014 TUI Travel A&D. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A category on NSString to provide JSON functionality
 */
@interface NSString (JSON)

/**
 @methodName JSONDictionary
 @abstract Produces a JSON dictionary out of the current string
 @discussion This method parses the current string and produces a JSON dictionary
 
 @return A JSON dictionary.
 */
- (NSDictionary *)JSONDictionary;

@end
