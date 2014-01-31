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
        
        self.viewControllers = viewControllers;
        
    }
    return self;
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.viewControllers.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
