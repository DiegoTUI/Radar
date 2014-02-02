//
//  NSString+TUIString.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 07/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A NSString category to supply TUI specific NSString methods
 */
@interface NSString (TUIString)

/**
 @methodName truncateToNearestWordAtIndex:
 @abstract Trim leading whitespace from a string
 @discussion This method will trim leading whitespace from a string
 e.g "  this string", trimmed to "this string"
 
 @return The trimmed string
 */
- (NSString*)stringByTrimmingLeadingWhitespace;

/**
 @methodName truncateToNearestWordAtIndex:
 @abstract Truncate a string to the nearest word at an index
 @discussion This method will truncate a string to the end of nearest word
 at a given index, e.g "this is a string", truncated at index 0 will truncate to "this"
 
 @param index The index to truncate to
 
 @return The truncated string
 */
- (NSString *)truncatedStringToNearestWordAtIndex:(NSUInteger)index;

/**
 @methodName isValidEmail
 @abstract Checks if the string is a valid e-mail
 @discussion This method will check if the current string is a valid email.
 
 @return YES if it's a valid email. NO otherwise.
 */
- (BOOL)isValidEmail;

/**
 @methodName randomStringWithLength:
 @abstract Generates a random string with the given length
 @discussion This method returns a random string with a given length.
 
 @param length The length of the desired random string
 
 @return The random string generated.
 */
+ (NSString *)randomStringWithLength:(NSUInteger)length;

/**
 @methodName urlEncodedString
 @abstract Returns the URL encoded version of self
 @discussion This method returns the URL encoded version of self
 
 @return The URL encoded string.
 */
- (NSString *)urlEncodedString;

/**
 @methodName whiteSpaceTrimmedString
 @abstract Returns the whitespace trimmed version of the string
 @discussion This method trims all the whitespaces from the beginning and end of the current
 string and returns the result
 
 @return The whitespace trimmed string.
 */
- (NSString *)stringByTrimmingWhitespace;

@end
