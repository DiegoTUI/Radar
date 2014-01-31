//
//  TUIBookingViewController.m
//  Radar
//
//  Created by jmartin on 28/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBookingViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"
// Controllers
#import "TUIBookingSendButtonViewController.h"
#import "TUIBookingListViewController.h"

static NSInteger kSendButtonViewHeight = 100;

@interface TUIBookingViewController ()

@property (retain, nonatomic) UINavigationBar *navController;

@property (weak, nonatomic) IBOutlet UIView *containerBookingForm;

@property (weak, nonatomic) IBOutlet UIView *containerBookingSendButton;

//@property (weak, nonatomic) TUIBookingSendButtonViewController *bookingSendButtonViewCotroller;


@end

@implementation TUIBookingViewController


#pragma mark - Data

- (void)initData
{
    [super initData];
}


#pragma mark - User interface

- (void)initUserInterface
{
    [super initUserInterface];
    [self initContainerBookingForm];
    [self initContainerBookingSendButton];
    self.title = NSLocalizedString(@"FORM_BOOKING_TITLE", nil);
}


- (void)initContainerBookingForm
{
    _containerBookingForm.x = ZERO_FLOAT;
    _containerBookingForm.y = ZERO_FLOAT;
    _containerBookingForm.width = self.view.width;
    _containerBookingForm.height = self.view.height - kSendButtonViewHeight;
}

- (void)initContainerBookingSendButton
{
    _containerBookingSendButton.x = ZERO_FLOAT;
    _containerBookingSendButton.y = _containerBookingForm.origin.y + _containerBookingForm.height;
    _containerBookingSendButton.width = self.view.width;
    _containerBookingSendButton.height = kSendButtonViewHeight;
}

#pragma mark - Segue -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:BOOKING_CONFIRMATION_SEGUE])
    {
        TUIBookingListViewController *bookingListViewController = (TUIBookingListViewController *)segue.destinationViewController;
        bookingListViewController.basket = _basket;
    }
}

@end
