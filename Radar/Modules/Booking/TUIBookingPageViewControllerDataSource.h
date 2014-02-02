//
//  TUIBookingPageViewControllerDataSource.h
//  Radar
//
//  Created by jmartin on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIPageViewControllerDataSource.h"
// Forward declarations
@class TUIBasket;

@interface TUIBookingPageViewControllerDataSource : NSObject<UIPageViewControllerDataSource>

- (TUIBookingPageViewControllerDataSource *)initWithBasket:(TUIBasket *)basket;

/**
 The view controllers of the data source
 */
@property (nonatomic, strong) NSArray *viewControllers;

@end
