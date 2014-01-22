//
//  NSURL+TUIURLSpec.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "NSURL+TUIURL.h"

SPEC_BEGIN(NSURL_TUIURLSpec)

describe(@"NSURL+TUIURL", ^{
    it(@"should return the API URL", ^{
        [[[[NSURL APIURL] absoluteString] should] equal:API_URL];
    });
});

SPEC_END