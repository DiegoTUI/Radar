//
//  TUIBaseButton_Private.h
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseButton.h"

@interface TUIBaseButton ()

/**
 @methodName setup
 @abstract setup should be overwritten in TUIBaseButton subclasses to perform setup tasks
 @discussion This method should perform setup logic in subclasses of TUIBaseButton,
 it is invoked on init.
 */
- (void)setup;

/**
 @methodName setupAccessibility
 @abstract Setup the accessibility labels of the view.
 */
- (void)setupAccessibility;

@end
