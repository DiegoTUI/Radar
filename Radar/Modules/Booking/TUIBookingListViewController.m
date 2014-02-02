//
//  TUIBookingListViewController.m
//  Radar
//
//  Created by jmartin on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBookingListViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"
// Controllers
#import "TUIBookingPageViewControllerDataSource.h"

@interface TUIBookingListViewController ()<UIPageViewControllerDelegate>

/**
 The time filter container view
 */
@property (weak, nonatomic) IBOutlet UIView *bookingContainerView;

@property (strong, nonatomic) UIPageViewController *bookingPageViewController;

@property (strong, nonatomic) TUIBookingPageViewControllerDataSource *bookingDataSource;

@end

@implementation TUIBookingListViewController

#pragma mark - Data -

- (void)initData
{
    [super initData];
    // set view controllers from containers
    
    self.bookingDataSource = [[TUIBookingPageViewControllerDataSource alloc] initWithBasket:_basket];
    self.bookingPageViewController.dataSource = _bookingDataSource;
    self.bookingPageViewController.delegate = self;
    
    [self.bookingPageViewController setViewControllers:@[self.bookingDataSource.viewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}


#pragma mark - User interface -

- (void)initUserInterface
{
    [super initUserInterface];
    CGPoint bookingViewFrame = CGPointMake(ZERO_INT, 40);
    
    [self.bookingContainerView setOrigin:(bookingViewFrame)];
    [self.bookingContainerView setSize:CGSizeMake(self.view.width, 336.0)];
    
    self.title = NSLocalizedString(@"LIST_BOOKING_TITLE", nil);
}


#pragma mark - Segue -
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"bookingContainerSegue"])
    {
        self.bookingPageViewController = [segue destinationViewController];
    }
    
}


@end
