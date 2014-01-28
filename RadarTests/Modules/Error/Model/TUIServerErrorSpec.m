//
//  TUIServerErrorSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/13/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"

#import "TUIServerError.h"

SPEC_BEGIN(TUIServerErrorSpec)

__block TUIServerError *serverError;

beforeAll(^{
    serverError = [[TUIServerError alloc] init];
});

describe(@"TUIServerErrorSpec", ^{
    it(@"shoudld subclass TUIBaseModel", ^{
        [[TUIServerError should] beSubclassOfClass:[TUIBaseModel class]];
    });
    
    it(@"should have an title", ^{
        [[serverError should] respondToSelector:@selector(title)];
    });
    
    it(@"should have an code", ^{
        [[serverError should] respondToSelector:@selector(code)];
    });
    
    it(@"should have a message", ^{
        [[serverError should] respondToSelector:@selector(message)];
    });
});

SPEC_END