//
//  TUIBasePageViewControllerSpec.m
//  laterooms
//
//  Created by Diego Lafuente on 1/19/14.
//  Copyright 2014 TUI Travel. All rights reserved.
//

#import "Kiwi.h"
#import "TUIBasePageViewController.h"

SPEC_BEGIN(TUIBasePageViewControllerSpec)

describe(@"TUIBasePageViewControllerSpec", ^{
    it(@"should be a subclass of UITableViewController", ^{
        [[TUIBasePageViewController should] beSubclassOfClass:[UIPageViewController class]];
    });
});

SPEC_END