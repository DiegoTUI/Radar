//
//  TUIBaseViewController_Private.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"

/**
 TUIBaseViewController_Private is a extension of the TUIBaseViewController class and exposes some private methods
 */
@interface TUIBaseViewController ()

/**
 @methodName initData:
 @abstract initData should be overwritten in TUIBaseViewController subclasses to perform data setup
 @discussion This method should perform data initiliation and setup logic in subclasses of TUIBaseViewController,
 it is invoked on init
 */
- (void)initData;

/**
 @methodName updateData:
 @abstract updateData should be overwritten in TUIBaseViewController subclasses to perform data updates
 @discussion This method should perform data updates. It is invoked on viewWillAppear.
 */
- (void)updateData;

/**
 @methodName deinitData:
 @abstract deinitData should be overwritten in TUIBaseTableViewController subclasses to perform data cleaning
 @discussion This method should perform data cleaning in subclasses of TUIBaseViewController,
 it is invoked on deallocation
 */
- (void)deinitData;

/**
 @methodName initUserInterface:
 @abstract initUserInterface should be overwritten in TUIBaseViewController subclasses to perform interface setup
 @discussion This method should perform user interface setup logic in subclasses of TUIBaseViewController and is
 invoked on viewDidLoad:
 */
- (void)initUserInterface;

/**
 @methodName updateUserInterface:
 @abstract updateUserInterface should be overwritten in TUIBaseViewController subclasses to perform interface updates
 @discussion This method should perform user interface updates on viewWillAppear.
 */
- (void)updateUserInterface;

/**
 @methodName deinitUserInterface:
 @abstract deinitUserInterface should be overwritten in TUIBaseViewController subclasses to perform interface cleaning
 @discussion This method should perform user interface updates on deallocation.
 */
- (void)deinitUserInterface;

/**
 @methodName adjustScrollViewInsetsForScrollView
 @abstract Adjusts the top content inset of a scroll view to the iOS 7 default
 @discussion This method is used to manually set top content inset of a scrollview to align
 with iOS 7 navigation bar overlays. This functions the same as the Adjust Scroll View Insets
 option availabel in interface builder.
 
 @param scrollView The UIScrollView to adjust the top inset of.
 
 */
- (void)adjustScrollViewInsetsForScrollView:(UIScrollView *)scrollView;

/**
 Replaces the original iOS back button with a simple back arrow image button
 */
- (void)initCustomLeftBarButtonItem;

/**
 @methodName initNavigationBar
 @abstract initNavigationBar should be overwritten when the appearance of the navigation bar needs to be modified.
 */
- (void)initNavigationBar;

/**
 @methodName updateGlobalNavigationBehavior
 @abstract updateGlobalNavigationBehavior should be overwritten to modify the global navigation behavior.
 */
- (void)updateGlobalNavigationBehavior;

/**
 @methodName setInteractivePopGestureEnabled:
 @abstract Activate or deactivate the pop gesture available from iOS7.
 @param enabled Whether enable or disable the pop gesture.
 */
- (void)setInteractivePopGestureEnabled:(BOOL)enabled;

@end



/**
 The Keyboard category of TUIBaseViewController handles keyboard event and modifies the scroll view's inset accordingly.
 */
@interface TUIBaseViewController (Keyboard)

/**
 Register a scroll view for keyboard events and update its insets automatically.
 @param scrollView The scroll view to register to inset updates.
 */
- (void)registerScrollViewForKeyboardBehavior:(UIScrollView *)scrollView;

/**
 Will hide the keyboard depending on set tap interception view.
 */
- (void)hideKeyboard;

/**
 Return the view which intercepts the tap to close the keyboard.
 @return Returns the view which intercepts taps and that event dismisses the keyboard.
 */
- (UIView *)tapInterceptionView;

/**
 @methodName initGestureToHideKeyboard
 @abstract A tap gesture recognizer is added to the tapInterceptionView to be able to hide the keyboard after touching that view.
 */
- (void)initGestureToHideKeyboard;

/**
 Register self as an observer of Keyboard notifications.
 */
- (void)observeKeyboard;

/**
 Unregister self as an observer of Keyboard notifications..
 */
- (void)stopObservingKeyboard;

/**
 Called when the UIKeyboardWillShowNotification is fired.
 @param aNotification The notification object.
 */
- (void)keyboardWasShown:(NSNotification*)aNotification;

/**
 Called when the UIKeyboardWillHideNotification is fired.
 @param aNotification The notification object.
 */
- (void)keyboardWillBeHidden:(NSNotification*)aNotification;

@end