//
//  TUIPageViewControllerDataSource.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIPageViewControllerDataSource.h"
// Controllers
#import "TUIFilterContentViewController.h"

@implementation TUIPageViewControllerDataSource
@synthesize filterStatusDelegate = _filterStatusDelegate;


#pragma mark - Data source delegate -

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TUIFilterContentViewController*) viewController).pageIndex;
    
    if ((index == _viewControllers.count-1) || (index == NSNotFound)) {
        return nil;
    }
    
    index++;
    return _viewControllers[index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TUIFilterContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return _viewControllers[index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [_viewControllers count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return ZERO_INT;
}

@end
