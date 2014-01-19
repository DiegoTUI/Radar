//
//  TUISpotsViewController.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"

// Forward declarations
@protocol TUISpotsViewControllerDelegate;

@interface TUISpotsViewController : TUIBaseViewController

/**
 The TUISpotsViewController delegate
 */
@property (nonatomic, weak) id<TUISpotsViewControllerDelegate> delegate;

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

@end

/**
 The delegate for TUISpotsViewController to dispatch when the handler button has been pressed
 */
@protocol TUISpotsViewControllerDelegate <NSObject>

@required

/**
 Tell the delegate to display the list
 */
- (void)displayList;

/**
 Tell the delegate to hide the list
 */
- (void)hideList;

@end
