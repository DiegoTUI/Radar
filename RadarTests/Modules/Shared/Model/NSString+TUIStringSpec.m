//
//  NSString+TUIStringSpec.m
//  laterooms
//
//  Created by Diego Lafuente on 1/7/14.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "NSString+TUIString.h"


SPEC_BEGIN(NSString_TUIStringSpec)

describe(@"NSString+TUIString", ^{
    
    __block NSString *string;
    
    beforeAll(^{
        string = @"This is a test string to test with";
    });
    
    describe(@"When truncating strings at words", ^{
        it(@"should trunacte the string to the nearest word", ^{
            NSString *testString = [string truncatedStringToNearestWordAtIndex:6];
            [[testString should] equal:@"This is..."];
        });
        
        it(@"should return the original string if the index is longer than the string", ^{
            NSString *testString = [string truncatedStringToNearestWordAtIndex:1000];
            [[testString should] equal:string];
        });
        
        it(@"should return the original string if the index is invalid", ^{
            NSString *testString = [string truncatedStringToNearestWordAtIndex:-100];
            [[testString should] equal:string];
        });
    });
    
    describe(@"when truncating strings by width", ^{
        
        __block UIFont *font;
        __block NSString *string;
        
        beforeAll(^{
            font = [UIFont systemFontOfSize:12];
            string = @"This is a long string to test truncation width";
        });
        
        it(@"shouldn't truncate if the string is longer than the width", ^{
            NSString *testString = [string truncatedStringToFitWidth:1000 withFont:font];
            [[testString should] equal:testString];
        });
    });
    
    describe(@"when checking e-mail strings", ^{
        
        it(@"should return YES if the e-mail is valid", ^{
            NSString *validEmail = @"mg1987@gmail.com";
            [[theValue([validEmail isValidEmail]) should] beTrue];
        });
        
        it(@"should return NO if the e-mail is not valid", ^{
            NSString *validEmail = @"mg1987@crap";
            [[theValue([validEmail isValidEmail]) should] beFalse];
        });
        
    });
    
    describe(@"when trimming white spaces", ^{
        
        it(@"should remove white spaces from the beginning of the string when calling stringByTrimmingLeadingWhitespace", ^{
            NSString *inputString = @"    teststring\n    ";
            NSString *outputString = [inputString stringByTrimmingLeadingWhitespace];
            
            [[outputString should] equal:@"teststring\n    "];
        });
        
        it(@"should remove white spaces from the beginning and end of the string when calling stringByTrimmingWhitespace", ^{
            NSString *inputString = @"    teststring\n    ";
            NSString *outputString = [inputString stringByTrimmingWhitespace];
            
            [[outputString should] equal:@"teststring\n"];
        });
    });
    
    describe(@"when generating random strings", ^{
        
        __block NSUInteger iterations;
        __block NSString *alphabet;
        __block NSUInteger length;
        
        beforeAll(^{
            iterations = 10000;
            alphabet = @"abcdefghijklmnopqrstuvwxyz0123456789";
            length = 8;
        });
        
        it(@"should generate strings of the given length", ^{
            for (int i=0; i<iterations; i++)
            {
                [[[NSString randomStringWithLength:length] should] haveLengthOf:length];
            }
        });
        
        it(@"should generate real random strings", ^{
            NSUInteger base = [alphabet length];
            NSMutableArray *frecuencies = [NSMutableArray arrayWithCapacity:0];
            
            for (int j=0; j<base; j++)
            {
                [frecuencies addObject:[NSNumber numberWithInt:0]];
            }
            
            for (int i=0; i<iterations; i++)
            {
                NSString *randomid = [NSString randomStringWithLength:length];
                
                for (int p=0; p<length; p++)
                {
                    NSString *currentcharacter = [randomid substringWithRange:NSMakeRange(p, 1)];
                    NSRange position = [alphabet rangeOfString:currentcharacter];
                    NSNumber *number = (NSNumber *)[frecuencies objectAtIndex:position.location];
                    [frecuencies replaceObjectAtIndex:position.location withObject:[NSNumber numberWithInt:[number integerValue]+1]];
                }
            }
            
            NSInteger totalchars = iterations * length;
            NSInteger sqrt = (NSInteger)sqrtf(totalchars);
            NSInteger average = totalchars / base;
            
            for (int i=0; i<base; i++)
            {
                NSInteger deviation = abs([(NSNumber *)[frecuencies objectAtIndex:i] integerValue] - average);
                [[theValue(deviation) should] beLessThan:theValue(sqrt)];
            }
        });
        
    });
    
});

SPEC_END