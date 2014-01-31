//
//  TUIBasketViewController.h
//  Radar
//
//  Created by Diego Lafuente on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"
// Forward declarations
@class TUIBasket;

/**
 View controller for the basket slide view
 */
@interface TUIBasketViewController : TUIBaseViewController

/**
 The basket
 */
@property (strong, nonatomic) TUIBasket *basket;

@end
