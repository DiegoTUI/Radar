//
//  TUIBaseController.m
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseController.h"

// Extensions
#import "TUIBaseController_Private.h"


@implementation TUIBaseController


#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if(self)
    {
        [self initData];
    }
    return self;
}


#pragma mark - Setup

- (void)initData
{}

@end
