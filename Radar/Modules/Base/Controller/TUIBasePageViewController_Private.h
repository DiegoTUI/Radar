//
//  TUIBasePageViewController_Private.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 20/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasePageViewController.h"

@interface TUIBasePageViewController ()

/**
 @methodName initData:
 @abstract initData should be overwritten in TUIBasePageViewController subclasses to perform data setup
 @discussion This method should perform data initiliation and setup logic iƒ subclasses of TUIBaseViewController,
 it is invoked on init
 */
- (void)initData;

/**
 @methodName updateData:
 @abstract updateData should be overwritten in TUIBasePageViewController subclasses to perform data updates
 @discussion This method should perform data updates. It is invoked on viewWillAppear.
 */
- (void)updateData;

/**
 @methodName deinitData:
 @abstract deinitData should be overwritten in TUIBasePageViewController subclasses to perform data cleaning
 @discussion This method should perform data cleaning in subclasses of TUIBaseViewController,
 it is invoked on deallocation
 */
- (void)deinitData;

/**
 @methodName initUserInterface:
 @abstract initUserInterface should be overwritten in TUIBasePageViewController subclasses to perform interface setup
 @discussion This method should perform user interface setup logic in subclasses of TUIBaseViewController and is
 invoked on viewDidLoad:
 */
- (void)initUserInterface;

/**
 @methodName updateUserInterface:
 @abstract updateUserInterface should be overwritten in TUIBasePageViewController subclasses to perform interface updates
 @discussion This method should perform user interface updates on viewWillAppear.
 */
- (void)updateUserInterface;

/**
 @methodName deinitUserInterface:
 @abstract deinitUserInterface should be overwritten in TUIBasePageViewController subclasses to perform interface cleaning
 @discussion This method should perform user interface updates on deallocation.
 */
- (void)deinitUserInterface;

@end
