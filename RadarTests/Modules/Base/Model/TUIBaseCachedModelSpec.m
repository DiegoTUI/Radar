//
//  TUIBaseCachedModelSpec.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 1/9/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUIBaseCachedModel.h"


SPEC_BEGIN(TUIBaseCachedModelSpec)

__block TUIBaseCachedModel *cachedModel;

beforeAll(^{
    cachedModel = [[TUIBaseCachedModel alloc] init];
});

describe(@"TUIBaseCachedModel", ^{
    
    it(@"Should throw exceptions when calling dictionary", ^{
        @try
        {
            [cachedModel dictionary];
        }
        @catch (NSException *e)
        {
            [[e shouldNot] beNil];
            [[e.name should] equal:NSInternalInconsistencyException];
        }
        
    });
    
    it(@"Should throw exceptions when calling objectFromDictionary", ^{
        @try
        {
            [TUIBaseCachedModel objectFromDictionary:[NSDictionary dictionary]];
        }
        @catch (NSException *e)
        {
            [[e shouldNot] beNil];
            [[e.name should] equal:NSInternalInconsistencyException];
        }
        
    });
    
    it(@"Should never expire", ^{
        [[theValue([cachedModel isExpired]) should] beFalse];
    });
});

SPEC_END