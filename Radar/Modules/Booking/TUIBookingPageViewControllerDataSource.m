//
//  TUIBookingPageViewControllerDataSource.m
//  Radar
//
//  Created by jmartin on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBookingPageViewControllerDataSource.h"
// Controllers
#import "TUIBookingPageContentViewController.h"
// Models
#import "TUIBasket_Private.h"


@implementation TUIBookingPageViewControllerDataSource


#pragma mark - Init -

- (TUIBookingPageViewControllerDataSource *)initWithBasket:(TUIBasket *)basket
{
    self = [super init];
    if (self)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        NSMutableArray *viewControllers = [NSMutableArray array];
        for (TUIAtlasTicket *atlasTicket in basket.spots)
        {
            TUIBookingPageContentViewController *bookingPageContentViewController = [storyboard instantiateViewControllerWithIdentifier:@"TUIBookingPageContentViewController"];
            [bookingPageContentViewController setViewControllerWithAtlasTicket:atlasTicket];
            [viewControllers addObject:bookingPageContentViewController];
        }
        
        _viewControllers = viewControllers;
        
    }
    return self;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [_viewControllers indexOfObject:viewController];
    
    if ((index == _viewControllers.count-ONE_INT) || (index == NSNotFound)) {
        return nil;
    }
    
    index++;
    return _viewControllers[index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [_viewControllers indexOfObject:viewController];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return _viewControllers[index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.viewControllers.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return ZERO_INT;
}

@end
