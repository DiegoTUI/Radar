//
//  TUISearchViewController+Basket.m
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISearchViewController+Basket.h"
// Extensions
#import "TUISearchViewController_Private.h"
// Models
#import "TUIBasket.h"
#import "TUISpotList.h"
// Views
#import "TUISpotListCell.h"
// Controllers
#import "TUISlidingBookingViewController.h"

static const CGFloat kBasketButtonNegativeSpacer = -10.0f;


@interface TUISearchViewController ()

@end

@implementation TUISearchViewController (Basket)


#pragma mark - Init -

- (void)initBasket
{
    self.basket = [[TUIBasket alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellAdded:) name:CELL_ADDED_NOTIFICATION object:nil];
}

- (void)initBasketButton
{
    self.basketButton = [[TUIBasketButton alloc] initAsBarButton];
    [self.basketButton addTarget:self action:@selector(basketButtonClicked:)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *basketBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.basketButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:kBasketButtonNegativeSpacer];
    
    self.basketButton.enabled = NO;
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, basketBarButton,nil];
}

#pragma mark - Basket button -

- (void)basketButtonClicked:(TUIBasketButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:TUIBasketButtonPressedNotification
                                                        object:self.basket
                                                      userInfo:nil];
}


#pragma mark - Cell added -

- (void)cellAdded:(NSNotification *)notification
{
    NSLog(@"cell added notification");
    if ([notification.object isKindOfClass:[TUISpotListCell class]])
    {
        [(TUISpotListCell *)notification.object setDelegate:self];
    }
}


#pragma mark - TUISpotAddRemoveDelegate methods - 

- (void)addSpotButtonPressedInCell:(TUISpotListCell *)sender
{
    NSLog(@"delegate add spot pressed in cell: %@", sender.titleLabel.text);
    [sender addToBasketAnimated];
    NSIndexPath *indexPath = [self.spotsViewController indexPathForCell:sender];
    TUISpotList *spotList = [self.spotsViewController currentSpotList];
    TUIAtlasTicket *ticketToAddToBasket = (TUIAtlasTicket *)spotList.spots[indexPath.row];
    [self.basket addAtlasTicket:ticketToAddToBasket];
    [self.basketButton showCounterAnimatedWithText:[NSString stringWithFormat:@"%d", [self.basket ticketCount]]];
    
    self.basketButton.enabled = YES;
}

- (void) removeSpotButtonPressedInCell:(TUISpotListCell *)sender
{
     NSLog(@"delegate remove spot pressed in cell: %@", sender.titleLabel.text);
    [sender removeFromBasketAnimated];
    NSIndexPath *indexPath = [self.spotsViewController indexPathForCell:sender];
    TUISpotList *spotList = [self.spotsViewController currentSpotList];
    TUIAtlasTicket *ticketToRemoveFromBasket = (TUIAtlasTicket *)spotList.spots[indexPath.row];
    [self.basket removeAtlasTicket:ticketToRemoveFromBasket];
    if ([self.basket ticketCount] > 0)
    {
        [self.basketButton showCounterAnimatedWithText:[NSString stringWithFormat:@"%d", [self.basket ticketCount]]];
    }
    else
    {
        [self.basketButton hideCounterAnimated];
        self.basketButton.enabled = NO;
    }
}

@end
