//
//  TUISlidingBookingViewController.m
//  Radar
//
//  Created by Diego Lafuente on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISlidingBookingViewController.h"
// Models
#import "TUIBaseViewController_Private.h"
// Controllers
#import "TUIBasketViewController.h"

NSString *const TUIBasketButtonPressedNotification = @"TUIBasketButtonPressedNotification";

@interface TUISlidingBookingViewController ()

@end

@implementation TUISlidingBookingViewController


#pragma mark - View lifecycle -


- (void)viewDidLoad
{
    [self initTopViewController];
    
    [super viewDidLoad];
	
    [self initUserInterface];
    [self initBasketButtonListeners];
}

- (void)dealloc
{
    [self deinitBasketButtonListeners];
}

#pragma mark - Initialize user interface

- (void)initTopViewController
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.topViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"HomeNavigationController"];
}

- (void)initUserInterface
{
    [self initRootViewControllers];
    //[self initShadow];
    //[self registerForGlobalNavigationStateChanges];
    //[self listenForHorizontalPositionChange];
}

- (void)initRootViewControllers
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.underRightViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"BasketNavigationViewController"];
    
    //init the controller
    //[(TUIBaseViewController *)[(UINavigationController *)self.underRightViewController topViewController] initData];
    //[(TUIBaseViewController *)[(UINavigationController *)self.underRightViewController topViewController] initUserInterface];
    
    self.anchorRightPeekAmount = SLIDING_VIEW_CONTROLLER_LEFT_PEEK_AMOUNT;
    self.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping;
}

#pragma mark - Global navigation button listeners

- (void)initBasketButtonListeners
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(basketButtonPressed:)
                                                 name:TUIBasketButtonPressedNotification
                                               object:nil];
}

- (void)deinitBasketButtonListeners
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:TUIBasketButtonPressedNotification
                                                  object:nil];
}

- (void)basketButtonPressed:(NSNotification *)notification
{
    typeof(self) __weak weakSelf = self;
    
    //[self anchorTopViewToLeftAnimated:YES];
    
    [self anchorTopViewToLeftAnimated:YES onComplete:^{
        typeof(self) strongSelf = weakSelf;
        if ( !strongSelf ) { return ;}
        
        TUIBasketViewController *basketViewController = (TUIBasketViewController *)[(UINavigationController *)strongSelf.underRightViewController topViewController];
        [basketViewController setBasket:notification.object];
    }];
}


@end
