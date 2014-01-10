//
//  NSString+JSONSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/7/14.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"


SPEC_BEGIN(NSString_JSONSpec)

describe(@"NSString+JSON", ^{
    
    describe(@"When parsing a JSON", ^{
        it(@"should produce a valid dictionary if a valid JSON string is provided", ^{
            NSString *testString = @"{\"key1\":\"value1\", \n\"key2\":\"value2\"}";
            NSDictionary *dictionary = [testString JSONDictionary];
            [[dictionary shouldNot] beNil];
            [[dictionary[@"key1"] should] equal:@"value1"];
            [[dictionary[@"key2"] should] equal:@"value2"];
        });
        
        it(@"should return nil if the JSON string is not valid", ^{
            NSString *testString = @"malformed JSON";
            NSDictionary *dictionary = [testString JSONDictionary];
            [[dictionary should] beNil];
        });
    });
});

SPEC_END