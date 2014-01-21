//
//  TUIFilterListViewController.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 20/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"
// Forward declaration
@protocol TUIFilterListViewControllerDelegate;

@interface TUIFilterListViewController : TUIBaseViewController

/**
 The TUISpotsViewController delegate
 */
@property (nonatomic, weak) id<TUIFilterListViewControllerDelegate> delegate;

/**
 Indicates if the list is displayed
 */
@property (nonatomic) BOOL displayed;

/**
 @methodName handlerButton
 @abstract Returns the handler button
 @discussion This method returns the handler button
 
 @return The handler button
 */
- (UIButton *)handlerButton;

/**
 @methodName filterHeight
 @abstract Returns the height of each filter
 @discussion This method returns the height of each filter
 
 @return The height of each filter
 */
- (CGFloat)filterHeight;

/**
 @methodName numberOfFilters
 @abstract Returns the number of filters in the list
 @discussion This method returns the number of filters in the list
 
 @return The number of filters in the list
 */
- (NSInteger)numberOfFilters;

@end


/**
 The delegate for TUIFilterListViewController to dispatch when the handler button has been pressed
 */
@protocol TUIFilterListViewControllerDelegate <NSObject>

@required

/**
 Tell the delegate to display the list
 */
- (void)displayFilters;

/**
 Tell the delegate to hide the list
 */
- (void)hideFilters;

@end