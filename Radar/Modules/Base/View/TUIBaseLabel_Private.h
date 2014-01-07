//
//  TUIBaseLabel_Private.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseLabel.h"

/**
 TUIBaseLabel_Private is a class extension of TUIBaseLabel and exposes some private methods
 */
@interface TUIBaseLabel ()

/**
 @methodName setup
 @abstract setup should be overwritten in TUIBaseLabel subclasses to perform setup tasks
 @discussion This method should perform setup logic in subclasses of TUIBaseLabel,
 it is invoked on init.
 */
- (void)setup;

/**
 @methodName setupAppearance
 @discussion Sets up how the label will appear, which font
 and color should be used.
 */
- (void)setupAppearance;

@end
