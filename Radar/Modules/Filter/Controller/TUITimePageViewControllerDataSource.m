//
//  TUITimePageViewControllerDataSource.m
//  Radar
//
//  Created by jmartin on 23/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUITimePageViewControllerDataSource.h"
// Controllers
#import "TUIFilterContentViewController.h"

@interface TUITimePageViewControllerDataSource ()

@end

@implementation TUITimePageViewControllerDataSource


#pragma mark - Init -

- (TUITimePageViewControllerDataSource *)init
{
    self = [super init];
    if (self)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        TUIFilterContentViewController *today = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        today.pageIndex = 0;
        today.labelString = @"Today";
        today.iconNameString = @"iconfilter-now";
        today.smallIcoImage = @"filter-now";
        
        TUIFilterContentViewController *tomorrow = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        tomorrow.pageIndex = 1;
        tomorrow.labelString = @"Tomorrow";
        tomorrow.iconNameString = @"iconfilter-tomorrow";
        tomorrow.smallIcoImage = @"filter-tomorrow";
        
        self.viewControllers = @[today, tomorrow];
    }
    return self;
}

@end
