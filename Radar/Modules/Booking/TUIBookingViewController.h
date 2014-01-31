//
//  TUIBookingViewController.h
//  Radar
//
//  Created by jmartin on 28/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"
// Forward declarations
@class TUIBasket;

@interface TUIBookingViewController : TUIBaseViewController

/**
 The basket
 */
@property (strong, nonatomic) TUIBasket *basket;

@end
