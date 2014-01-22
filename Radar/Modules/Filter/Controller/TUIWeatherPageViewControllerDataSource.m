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
        TUIFilterContentViewController *viewController1 = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        viewController1.pageIndex = 0;
        TUIFilterContentViewController *viewController2 = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        viewController1.pageIndex = 1;
        TUIFilterContentViewController *viewController3 = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        viewController1.pageIndex = 2;
        self.viewControllers = @[viewController1, viewController2, viewController3];
    }
    return self;
}



@end
