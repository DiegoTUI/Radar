//
//  TUISettingsViewController.h
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"

// Forward declarations
@protocol TUISettingsViewControllerDelegate;

/**
 The view controller for the settings screen
 */
@interface TUISettingsViewController : TUIBaseViewController

/**
 The TUISettingsViewController delegate
 */
@property (nonatomic, weak) id<TUISettingsViewControllerDelegate> delegate;

@end


/**
 The delegate for TUISettingsViewController to dispatch when the Save/Cancel buttons have been pressed.
 */
@protocol TUISettingsViewControllerDelegate <NSObject>

@required

/**
 Inform about pressed Save button
 */
- (void)saveButtonPressed;

/**
 Inform about pressed Cancel button
 */
- (void)cancelButtonPressed;

@end