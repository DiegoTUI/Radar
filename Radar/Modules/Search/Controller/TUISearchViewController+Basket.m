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

/**
 The basket.
 */
@property (nonatomic, strong) TUIBasket *basket;

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
    if ([notification.object isKindOfClass:[TUISpotListCell class]])
    {
        [(TUISpotListCell *)notification.object setDelegate:self];
    }
}

@end
