//
//  TUIBaseController_Private.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseController.h"

/**
 TUIBaseController_Private is a extension of the TUIBaseController class and exposes some private methods
 */
@interface TUIBaseController ()

/**
 @methodName initData:
 @abstract initData should be overwritten in TUIBaseController subclasses to perform data setup
 @discussion This method should perform data initiliation and setup logic in subclasses of TUIBaseController,
 it is invoked on init.
 */
- (void)initData;

@end
