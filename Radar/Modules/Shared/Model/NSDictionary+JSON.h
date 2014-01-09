//
//  NSDictionary+JSON.h
//  laterooms
//
//  Created by Diego Lafuente on 21/10/13.
//  Copyright (c) 2013 ustwo. All rights reserved.
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
