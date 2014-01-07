//
//  TUIBaseControllerSpec.m
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"


SPEC_BEGIN(TUIBaseControllerSpec)

describe(@"TUIBaseController", ^{
    it(@"Should subclass NSObject", ^{
        [[TUIBaseControllerSpec should] beSubclassOfClass:[NSObject class]];
    });
});

SPEC_END