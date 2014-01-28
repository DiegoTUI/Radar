//
//  TUIDistancePageViewControllerDataSource.m
//  Radar
//
//  Created by jmartin on 23/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIDistancePageViewControllerDataSource.h"
// Models
#import "TUIFilters.h"
// Controllers
#import "TUIFilterContentViewController.h"

@interface TUIDistancePageViewControllerDataSource ()

@end

@implementation TUIDistancePageViewControllerDataSource


#pragma mark - Init -

- (TUIDistancePageViewControllerDataSource *)init
{
    self = [super init];
    if (self)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        TUIFilterContentViewController *distance300m = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        distance300m.pageIndex = 0;
        distance300m.labelString =  NSLocalizedString(@"FILTERS_DISTANCE_300M", nil);
        distance300m.iconNameString = @"iconfilter-300m";
        distance300m.smallIcoImage = @"filter-300m";
        
        TUIFilterContentViewController *distance1km = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        distance1km.pageIndex = 1;
        distance1km.labelString = NSLocalizedString(@"FILTERS_DISTANCE_1000M", nil);
        distance1km.iconNameString = @"iconfilter-1km";
        distance1km.smallIcoImage = @"filter-1km";
        
        TUIFilterContentViewController *distanceMore1km = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        distanceMore1km.pageIndex = 2;
        distanceMore1km.labelString = NSLocalizedString(@"FILTERS_DISTANCE_FAR", nil);
        distanceMore1km.iconNameString = @"iconfilter-far";
        distanceMore1km.smallIcoImage = @"filter-far";
        
        self.viewControllers = @[distance300m, distance1km, distanceMore1km];
    }
    return self;
}

#pragma mark - Data source delegate -

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return [TUIFilters currentFilters].distanceFilterIndex;
}

@end
