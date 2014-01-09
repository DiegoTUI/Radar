//
//  NSString+TUIString.m
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 07/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "NSString+TUIString.h"

NSString *const kTruncationString = @"...";

@implementation NSString (TUIString)

#pragma mark - Truncation

- (NSString *)truncatedStringToNearestWordAtIndex:(NSUInteger)index
{
    NSString *string = self;
    
    if(self.length > index)
    {
        NSRange overlapRange = [self rangeOfComposedCharacterSequencesForRange:NSMakeRange(index, self.length - index)];
        NSString *overlapText = [self substringWithRange:overlapRange];
        NSRange spaceRange = [overlapText rangeOfString:@" " options:NSCaseInsensitiveSearch];
        NSRange range = NSMakeRange(0, index + spaceRange.location);
        NSString *text = [self substringWithRange:range];
        string = [text stringByAppendingString:kTruncationString];
    }
    
    return string;
}

- (NSString *)truncatedStringToFitWidth:(CGFloat)width withFont:(UIFont *)font
{
    // If there is no truncation we don't need to apply ...
    BOOL hasTruncated = NO;
    NSString *truncatedString = [self copy];
    
    // Reduce the string until it fits
    NSString *truncationString = @"...";
    CGSize truncationSize = [truncationString sizeWithAttributes:@{NSFontAttributeName: font}];
    while ([truncatedString sizeWithFont:font forWidth:INT16_MAX lineBreakMode:NSLineBreakByTruncatingTail].width + truncationSize.width > width) {
        truncatedString = [truncatedString substringToIndex:truncatedString.length - 1];
        hasTruncated = YES;
    }
    
    // If truncation then append ...
    if(hasTruncated)
    {
        truncatedString = [self truncatedString:truncatedString replacingChars:NO];
    }
    
    return truncatedString;
}

- (NSString *)truncatedStringToFitWidth:(CGFloat)width height:(CGFloat)height withFont:(UIFont *)font
{
    // If there is no truncation we don't need to apply ...
    BOOL hasTruncated = NO;
    NSString *truncatedString = [self copy];
    
    // Reduce the string until it fits
    while ([truncatedString sizeWithFont:font constrainedToSize:CGSizeMake(width, INT16_MAX) lineBreakMode:NSLineBreakByWordWrapping].height > height) {
        truncatedString = [truncatedString substringToIndex:truncatedString.length - 1];
        hasTruncated = YES;
    }
    
    // If truncation then append ...
    if(hasTruncated)
    {
        truncatedString = [self truncatedString:truncatedString replacingChars:YES];
    }
    
    return truncatedString;
}


#pragma mark - Truncation (Private)

- (NSString *)truncatedString:(NSString *)string replacingChars:(BOOL)replacingChars
{
    // If the last character is a space remove it
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(string.length - 1, 1)];
    
    // Append the ... to the username, replacing the last 3 chars if long enough, if not just append ...
    if(string.length >= 3 && replacingChars)
    {
        string = [string stringByReplacingCharactersInRange:NSMakeRange(string.length - 3, 3) withString:kTruncationString];
        // Remove a space before the ... if it is there
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(string.length - 4, 1)];
    }
    else
    {
        string = [string stringByAppendingString:kTruncationString];
    }
    
    return string;
}

#pragma mark - Email

- (BOOL)isValidEmail
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

#pragma mark - Random strings

+ (NSString *)randomStringWithLength:(NSUInteger)length
{
    NSString *alphabet = @"abcdefghijklmnopqrstuvwxyz0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i = 0; i < length; i++) {
        u_int32_t randomResult = 0;
        int result = SecRandomCopyBytes(kSecRandomDefault, sizeof(int), (uint8_t*)&randomResult);
        if (result != 0)
            randomResult = arc4random();
        u_int32_t ratio = randomResult % [alphabet length];
        unichar character = [alphabet characterAtIndex:ratio];
        [randomString appendFormat:@"%C", character];
    }
    return [NSString stringWithString:randomString];
}

#pragma mark - URL Encoding

-(NSString *)urlEncodedString
{
    NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                             NULL,
                                                                                             (__bridge CFStringRef)self,
                                                                                             NULL,
                                                                                             (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                             kCFStringEncodingUTF8);
    
    return result;
}

#pragma mark - Whitespace trimming

- (NSString *)stringByTrimmingWhitespace
{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceCharacterSet];
    return [self stringByTrimmingCharactersInSet:whitespace];
}

- (NSString*)stringByTrimmingLeadingWhitespace
{
    NSInteger i = ZERO_INT;
    
    while ((i < [self length])
           && [[NSCharacterSet whitespaceCharacterSet] characterIsMember:[self characterAtIndex:i]]) {
        i++;
    }
    return [self substringFromIndex:i];
}

@end
