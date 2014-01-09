//
//  TUICache.h
//  Radar
//
//  Created by Diego Lafuente on 09/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseCachedModel.h"

/**
 The TUICache class provides a set of static methods to deal with cached objects
 */
@interface TUICache : TUIBaseModel

/**
 @methodName readObjectOfClass:forKey:
 @abstract Reads a serializable object from the standard cache
 @discussion This method reads NSUserDefaults looking for a certain key and builds an object of the given class with the results. It returns nil if the class provided does not respond to the TUISerializable protocol or does not inherit from TUIBaseModel.
 
 @param type The class of the object that will be built as response
 @param key The key pointing to the stored object
 
 @return A serializable TUIBaseModel object. Nil if the class provided does not conform to the TUISerializable protocol, does not inherit from TUIBaseModel or the object was not found in the standard cache.
 */
+ (TUIBaseModel<TUISerializable> *)readObjectOfClass:(Class)type
                                            forKey:(NSString *)key;

/**
 @methodName storeObject:forKey:
 @abstract Stores a serializable object into the standard cache
 @discussion This method should serialize the object into a string and store it in NSUserDefaults.
 
 @param object The object to serialize and store
 @param key The key pointing to the stored object
 */
+ (void)storeObject:(TUIBaseModel<TUISerializable> *)object
             forKey:(NSString *)key;

/**
 @methodName removeObjectForKey:
 @abstract Removes a serializable object from the standard cache
 @discussion This method should remove the object given by the key from NSUserDefaults.
 
 @param key The key pointing to the object to be removed
 */
+ (void)removeObjectForKey:(NSString *)key;

@end
