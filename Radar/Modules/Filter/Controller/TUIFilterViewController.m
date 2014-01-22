//
//  TUIFilterViewController.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 20/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIFilterViewController.h"
// Extensions
#import "TUIBasePageViewController_Private.h"
// Controllers
#import "TUIFilterSubViewController.h"

@interface TUIFilterViewController ()
{
    NSArray *imageArray;
    NSArray *textArray;
    
}
@end

@implementation TUIFilterViewController

#pragma mark - Data

- (void)initData
{
    [super initData];
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"filtersOptions" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *weatherData = [dict objectForKey:@"weather"];
    
    imageArray = [weatherData objectForKey:@"images"];
    textArray = [weatherData objectForKey:@"texts"];
    
    imageArray = @[@"iconfilter-indoor.png", @"iconfilter-outdoor.png"];
    textArray = @[@"Indoor", @"Outdoor"];;
    
}

#pragma mark - User interface

- (void)initUserInterface
{
    [super initUserInterface];
    
    self.dataSource = self;
   [self setViewControllers:@[[[TUIFilterSubViewController alloc] initWithImageName:imageArray[0] atIndex:0 atText:textArray[0]]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
}


-(TUIFilterSubViewController *)viewControllerAtIndex:(NSUInteger)index
{
    TUIFilterSubViewController *childViewController = [[TUIFilterSubViewController alloc] initWithNibName:@"TUIFilterSubViewController" bundle:nil];
    childViewController.pageIndex = index;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(TUIFilterSubViewController *)viewController {
    
    NSUInteger index = viewController.pageIndex;
    NSUInteger indexMax = imageArray.count;
    
    if (index == indexMax - ONE_INT) {
        return nil;
    }

    index++;
    
    
    return [[TUIFilterSubViewController alloc] initWithImageName:imageArray[index] atIndex:index atText:textArray[index++]];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(TUIFilterSubViewController *)viewController {
    
    NSUInteger index = viewController.pageIndex;
    
    if (viewController.pageIndex == ZERO_INT) {
        return nil;
    }
    
    index--;
    
    return [[TUIFilterSubViewController alloc] initWithImageName:imageArray[index] atIndex:index atText:textArray[index]];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return [imageArray count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    TUIFilterSubViewController* ctrl = (TUIFilterSubViewController*)pageViewController. viewControllers[0];
    return ctrl.pageIndex;
}

- (void)weatherViewController
{
    
}

@end
