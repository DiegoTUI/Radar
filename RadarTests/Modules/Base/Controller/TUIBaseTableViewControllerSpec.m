//
//  TUIBaseTableViewControllerSpec.m
//  laterooms
//
//  Created by Diego Lafuente on 1/19/14.
//  Copyright 2014 TUI Travel. All rights reserved.
//

#import "Kiwi.h"
#import "TUIBaseTableViewController.h"

SPEC_BEGIN(TUIBaseTableViewControllerSpec)

describe(@"TUIBaseTableViewController", ^{
    it(@"should be a subclass of UITableViewController", ^{
        [[TUIBaseTableViewController should] beSubclassOfClass:[UITableViewController class]];
    });
});

SPEC_END