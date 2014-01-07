//
//  TuiBaseView_Private.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseView.h"

/**
 TUIBaseView_Private is a class extension of TUIBaseView and exposes some private methods
 */
@interface TUIBaseView ()

/**
 @methodName setup
 @abstract setup should be overwritten in TUIBaseView subclasses to perform setup tasks
 @discussion This method should perform setup logic in subclasses of TUIBaseView,
 it is invoked on init.
 */
- (void)setup;

/**
 @methodName setupAccessibility
 @abstract Setup the accessibility labels of the view.
 */
- (void)setupAccessibility;

@end
