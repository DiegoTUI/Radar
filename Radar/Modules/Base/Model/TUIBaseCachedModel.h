//
//  TUIBaseCachedModel.h
//  Radar
//
//  Created by Diego Lafuente on 09/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"
#import "TUISerializable.h"

/**
 TUIBaseModel is a base class which all cached model classes should be subclassed from.
 Forces to implement the TUISerializable protocol to all its children
 */
@interface TUIBaseCachedModel : TUIBaseModel <TUISerializable>

/**
 @methodName isExpired
 @abstract Returns if the object is expired
 @discussion This method checks if an object has expired and returns the result.
 
 @return YES if the object has expired. NO otherwise.
 */

- (BOOL)isExpired;

@end
