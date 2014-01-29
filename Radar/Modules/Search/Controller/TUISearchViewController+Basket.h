//
//  TUISearchViewController+Basket.h
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISearchViewController.h"
// Models
#import "TUISpotAddRemoveDelegate.h"
// Forward declarations
@class TUIBasket;


/**
 Extension of TUISearchViewController to deal with basket issues.
 */
@interface TUISearchViewController (Basket) <TUISpotAddRemoveDelegate>

/**
 @methodName initBasket
 @abstract Init the basket
 @discussion Inits the basket by creating an empty basket
 */
- (void)initBasket;


@end
