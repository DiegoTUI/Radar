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


static NSInteger kSendButtonViewHeight = 100;

@interface TUIBookingViewController ()

@property (retain, nonatomic) UINavigationBar *navController;

@property (weak, nonatomic) IBOutlet UIView *containerBookingForm;

@property (weak, nonatomic) IBOutlet UIView *containerBookingSendButton;

@property (strong, nonatomic) TUIBookingSendButtonViewController *bookingSendButtonViewCotroller;


@end

@implementation TUIBookingViewController


#pragma mark - Data

- (void)initData
{
    [super initData];
    
    for (UIViewController *viewController in self.childViewControllers)
    {
        if ([viewController isKindOfClass:[TUIBookingSendButtonViewController class]])
        {
            _bookingSendButtonViewCotroller = (TUIBookingSendButtonViewController *)viewController;
            _bookingSendButtonViewCotroller.basket = _basket;
        }
        
    }
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

@end
