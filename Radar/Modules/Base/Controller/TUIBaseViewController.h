//
//  TUIBaseViewController.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

/**
 TUIBaseViewController is a base class which all UIViewController classes should be subclassed from.
 */
@interface TUIBaseViewController : UIViewController

/**
 The left bar button in navigation bar.
 */
@property (nonatomic) UIBarButtonItem *leftBarButtonItem;

/**
 The right bar button in navigation bar.
 */
@property (nonatomic) UIBarButtonItem *rightBarButtonItem;

@end
