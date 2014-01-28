//
//  TUIWeatherPageViewControllerDataSource.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIWeatherPageViewControllerDataSource.h"
// Models
#import "TUIFilters.h"
// Controllers
#import "TUIFilterContentViewController.h"

@interface TUIWeatherPageViewControllerDataSource ()

@end

@implementation TUIWeatherPageViewControllerDataSource


#pragma mark - Init -

- (TUIWeatherPageViewControllerDataSource *)init
{
    self = [super init];
    if (self)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        TUIFilterContentViewController *indoorFilterView = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        indoorFilterView.pageIndex = 0;
        indoorFilterView.labelString = NSLocalizedString(@"FILTERS_WEATHER_CLOUDY", nil);
        indoorFilterView.iconNameString = @"iconfilter-indoor";
        indoorFilterView.smallIcoImage = @"filter-indoor";
        
        
        TUIFilterContentViewController *outdoorFilterView = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        outdoorFilterView.pageIndex = 1;
        outdoorFilterView.labelString = NSLocalizedString(@"FILTERS_WEATHER_SUNNY", nil);
        outdoorFilterView.iconNameString = @"iconfilter-outdoor";
        outdoorFilterView.smallIcoImage = @"filter-outdoor";
        
        self.viewControllers = @[indoorFilterView, outdoorFilterView];
    }
    return self;
}


#pragma mark - Data source delegate -

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return [TUIFilters currentFilters].weatherFilterIndex;
}



@end
