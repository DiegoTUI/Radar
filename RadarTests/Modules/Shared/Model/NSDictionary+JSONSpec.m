//
//  NSDictionary+JSONSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/7/14.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"


SPEC_BEGIN(NSDictionary_JSONSpec)

describe(@"NSDictionary+JSON", ^{
    
    describe(@"When serializing a JSON", ^{
        it(@"should produce a valid JSON String", ^{
            NSDictionary *testDictionary = @{@"key1":@"value1",
                                             @"key2":@"value2"};
            NSString *string = [testDictionary JSONString];
            [[string shouldNot] beNil];
            NSDictionary *retrievedDictionary = [string JSONDictionary];
            [[retrievedDictionary shouldNot] beNil];
            [[retrievedDictionary[@"key1"] should] equal:@"value1"];
            [[retrievedDictionary[@"key2"] should] equal:@"value2"];
        });
    });
});

SPEC_END