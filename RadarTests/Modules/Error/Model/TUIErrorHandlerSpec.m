//
//  TUIErrorHandlerSpec.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUIErrorHandler.h"

SPEC_BEGIN(TUIErrorHandlerSpec)

describe(@"TUIErrorHandlerSpec", ^{
    
    it(@"should be a singleton", ^{
        [[TUIErrorHandler should] respondToSelector:@selector(sharedInstance)];
    });
    
});

SPEC_END