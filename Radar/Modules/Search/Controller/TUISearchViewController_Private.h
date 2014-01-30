//
//  TUISearchViewController_Private.h
//  Radar
//
//  Created by Diego Lafuente on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISearchViewController.h"
// Views
#import "TUIBasketButton.h"

/**
 Extension of TUISearchViewController with some private attributes.
 */
@interface TUISearchViewController ()

/**
 The basket.
 */
@property (nonatomic, strong) TUIBasket *basket;

/**
 The basket button.
 */
@property (nonatomic, strong) TUIBasketButton *basketButton;

@end
