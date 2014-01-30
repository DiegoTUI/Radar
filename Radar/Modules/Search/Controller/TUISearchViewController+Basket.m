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
    self.navigationItem.rightBarButtonItem = basketBarButton;
}

#pragma mark - Basket button -

- (void)basketButtonClicked:(TUIBasketButton *)sender
{
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
    }
}

@end
