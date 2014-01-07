//
//  TUISerializable.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TUIBaseModel;

/**
 The TUISerializable protocol defines methods which classes whom implement the protocol must implement
 to provide caching functionality. The TUIParser provides methods to serialize objects into dictionaries.
 */
@protocol TUISerializable <NSObject>

@required

/**
 @methodName dictionary:
 @abstract Serialize an object to a NSDictionary that can be translated into a JSON string
 @discussion This method should a NSDictionary from the object properties for caching pursposed.
 
 @return A NSDictionary
 */
- (NSDictionary *)dictionary;

/**
 @methodName objectFromDictionary:
 @abstract Parse a dictionary into a valid object
 @discussion This method should parse a dictionary into a TUIBaseModel or TUIBaseModel subclass object.
 
 @param dictionary The dictionary to parse
 
 @return A TUIBaseModel object
 */

+ (TUIBaseModel<TUISerializable> *)objectFromDictionary:(NSDictionary *)dictionary;

@end