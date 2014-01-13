//
//  NSDictionary+JSON.h
//  Radar
//
//  Created by Diego Lafuente on 21/10/13.
//  Copyright (c) 2014 TUI Travel A&D. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A category of NSDictionary which provides JSON functionility
 */
@interface NSDictionary (JSON)

/**
 @methodName JSONString
 @abstract Returns json string out of a NSDictionary
 @discussion This method will return a JSON string with the contents of the NSDictionary
 
 @return A JSON String
 */
- (NSString *)JSONString;

@end
