//
//  TUIBaseTableViewCell_Private.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseTableViewCell.h"

/**
 TUIBaseTableViewCell_Private is a class extension of TUIBaseTableViewCell and exposes some private methods
 */
@interface TUIBaseTableViewCell ()

/**
 @methodName setup
 @abstract setup should be overwritten in LRBaseTableViewCell subclasses to perform setup tasks
 @discussion This method should perform setup logic in subclasses of LRBaseTableViewCell,
 it is invoked on init.x
 */
- (void)setup;

/**
 @methodName setupAccessibility
 @abstract Setup the accessibility labels of the view.
 */
- (void)setupAccessibility;

/**
 @methodName setupSelectionStyle
 @abstract Setup the selection style of the view.
 */
- (void)setupSelectionStyle;

/**
 @methodName setupBackground
 @abstract Setup the background of the view.
 */
- (void)setupBackground;

@end
