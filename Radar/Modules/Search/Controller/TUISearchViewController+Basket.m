//
//  TUISearchViewController+Basket.m
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISearchViewController+Basket.h"
// Models
#import "TUIBasket.h"
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
}

- (void) removeSpotButtonPressedInCell:(TUISpotListCell *)sender
{
     NSLog(@"delegate remove spot pressed in cell: %@", sender.titleLabel.text);
    [sender removeFromBasketAnimated];
}

@end
