//
//  TUITimePageViewControllerDataSource.m
//  Radar
//
//  Created by jmartin on 23/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUITimePageViewControllerDataSource.h"
// Models
#import "TUIFilters.h"
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
        today.labelString = NSLocalizedString(@"FILTERS_TIME_TODAY", nil);
        today.iconNameString = @"iconfilter-now";
        today.smallIcoImage = @"filter-now";
        
        TUIFilterContentViewController *tomorrow = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        tomorrow.pageIndex = 1;
        tomorrow.labelString = NSLocalizedString(@"FILTERS_TIME_TOMORROW", nil);
        tomorrow.iconNameString = @"iconfilter-tomorrow";
        tomorrow.smallIcoImage = @"filter-tomorrow";
        
        self.viewControllers = @[today, tomorrow];
    }
    return self;
}


#pragma mark - Data source delegate -

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return [TUIFilters currentFilters].timeFilterIndex;
}

@end
