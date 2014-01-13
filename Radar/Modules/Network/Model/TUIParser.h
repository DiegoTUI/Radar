//
//  TUIParser.h
//  Radar
//
//  Created by Diego Lafuente on 13/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TUIBaseModel;

/**
 The TUIParser protocol defines methods which classes whom implement the protocol must implement
 to provide parsing functionality. The TUIParser provides methods to parse API responses into objects.
 */
@protocol TUIParser <NSObject>

@required

/**
 @methodName objectFromResponse:
 @abstract Parse a response into a valid object
 @discussion This method should parse a response into a TUIBaseModel or TUIBaseModel subclass object.
 
 @param response The API response to parse
 
 @return A TUIBaseModel object
 */
+ (TUIBaseModel *)objectFromResponse:(id)response;

/**
 @methodName responseIsValid:
 @abstract Validate if a response is valid
 @discussion This method should traverse the reponse and validate if it is valid for
 parsing into a TUIBaseModel object
 
 @param response The response to validate
 
 @return a BOOL indicating if the response is valid
 */
+ (BOOL)responseIsValid:(id)response;

@end
