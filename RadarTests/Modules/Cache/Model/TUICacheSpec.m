//
//  TUICacheSpec.m
//  laterooms
//
//  Created by Diego Lafuente Garcia on 9/17/13.
//  Copyright (c) 2013 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUICache.h"
#import "TUITestSerializableObject.h"


SPEC_BEGIN(TUICacheSpec)

__block NSString *testKey;
__block TUITestSerializableObject *testObject;

beforeAll(^{
    testKey = @"testcachekey";
    testObject = [[TUITestSerializableObject alloc] init];
    testObject.property1 = @"testvalue1";
    testObject.property2 = @"testvalue2";
    [TUICache removeObjectForKey:testKey];
});

describe(@"TUICache", ^{
    it(@"is empty at the beginning", ^{
        [[[TUICache readObjectOfClass:[TUITestSerializableObject class] forKey:testKey] should] beNil];
    });
    
    it(@"stores, retrieves and removes keys nicely in the standard cache", ^{
        [TUICache storeObject:testObject forKey:testKey];
        
        [[[(TUITestSerializableObject *)[TUICache readObjectOfClass:[TUITestSerializableObject class] forKey:testKey] property1] should] equal:@"testvalue1"];
        [[[(TUITestSerializableObject *)[TUICache readObjectOfClass:[TUITestSerializableObject class] forKey:testKey] property2] should] equal:@"testvalue2"];
        
        [TUICache removeObjectForKey:testKey];
        
        [[[TUICache readObjectOfClass:[TUITestSerializableObject class] forKey:testKey] should] beNil];
    });
    
    
    it(@"returns nil if the class passed does not conform to the TUISerializable protocol", ^{
        [TUICache storeObject:testObject forKey:testKey];
        
        [[(TUITestSerializableObject *)[TUICache readObjectOfClass:[TUIBaseModel class] forKey:testKey] should] beNil];
        
        [TUICache removeObjectForKey:testKey];
        
        [[[TUICache readObjectOfClass:[TUITestSerializableObject class] forKey:testKey] should] beNil];
    });
    
});

SPEC_END
