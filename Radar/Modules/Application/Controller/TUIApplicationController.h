//
//  TUIApplicationController.h
//  Radar
//
//  Created by Diego Lafuente on 13/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseController.h"

/**
 TUIApplicationController performs application startup tasks
 */
@interface TUIApplicationController : TUIBaseController

/**
 @methodName initApplication:withLaunchOptions:
 @abstract Inform the application controller that the application has finished launching
 @discussion This method will perform any startup tasks or routines to be performed as soon as
 the application is launched
 
 @param application The application that launched
 @param options The application options loaded on launch
 */
- (id)initApplication:(UIApplication *)application withLaunchOptions:(NSDictionary *)options;

@end
