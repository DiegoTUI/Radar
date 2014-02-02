//
//  TUIBookingSendButtonViewController.m
//  Radar
//
//  Created by jmartin on 28/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBookingSendButtonViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"
// Controllers
#import "TUIBookingListViewController.h"

@interface TUIBookingSendButtonViewController ()

@property (weak, nonatomic) IBOutlet UIButton *sendBookingButton;
@property (weak, nonatomic) IBOutlet UISwitch *rememberDataSwitch;

@end

@implementation TUIBookingSendButtonViewController

#pragma mark - Data

- (void)initData
{
    
    [super initData];
    
}


#pragma mark - User interface

- (void)initUserInterface
{
    
    [super initUserInterface];
    
}

#pragma mark - Segue -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:BOOKING_CONFIRMATION_SEGUE])
    {
        UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        TUIBookingListViewController *bookingListViewController = (TUIBookingListViewController *)navigationController.topViewController;
        bookingListViewController.basket = _basket;
    }
}

@end
