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


@implementation TUIBookingPageViewControllerDataSource


#pragma mark - Init -

- (TUIBookingPageViewControllerDataSource *)init
{
    self = [super init];
    if (self)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        TUIBookingPageContentViewController *booking1 = [storyboard instantiateViewControllerWithIdentifier:@"TUIBookingPageContentViewController"];
        booking1.pageIndex = 0;
        booking1.titleString = @"Tapiporlas secas";
        booking1.weatherString = @"INDOOR";
        booking1.priceString = @"25 €";
        booking1.referenceNumber = @"2812356";
        
        booking1.thumbString = @"actividadImg2";
        booking1.iconTypeString = @"iconlist-tui";
        booking1.bidiString = @"bidiFake";
        
        
        TUIBookingPageContentViewController *booking2 = [storyboard instantiateViewControllerWithIdentifier:@"TUIBookingPageContentViewController"];
        booking2.pageIndex = 1;
        booking2.titleString = @"Soho promenade";
        booking2.weatherString = @"OUTDOOR";
        booking2.priceString = @"125 €";
        booking2.referenceNumber = @"8372912";
        
        booking2.thumbString = @"actividadImg3";
        booking2.iconTypeString = @"iconlist-fsq";
        booking2.bidiString = @"bidiFake";
        
        self.viewControllers = @[booking1, booking2];
    }
    return self;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 2;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
