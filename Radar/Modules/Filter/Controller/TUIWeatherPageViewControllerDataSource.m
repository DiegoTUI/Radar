//
//  TUIWeatherPageViewControllerDataSource.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIWeatherPageViewControllerDataSource.h"
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
        
        indoorFilterView.labelString = @"Indoor";
        indoorFilterView.iconNameString = @"iconfilter-indoor";
        indoorFilterView.pageIndex = 0;
        
        
        TUIFilterContentViewController *outdoorFilterView = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        outdoorFilterView.pageIndex = 1;
        outdoorFilterView.labelString = @"Outdoor";
        outdoorFilterView.iconNameString = @"iconfilter-outdoor";
        
        self.viewControllers = @[indoorFilterView, outdoorFilterView];
    }
    return self;
}



@end
