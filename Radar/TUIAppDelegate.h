//
//  TUIAppDelegate.h
//  Radar
//
//  Created by Diego Lafuente on 07/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIApplicationController.h"

@interface TUIAppDelegate : UIResponder <UIApplicationDelegate>

/**
 The application controller handling the application lifecycle
 */
@property (nonatomic, strong, readonly) TUIApplicationController *applicationController;

/**
 The applications window
 */
@property (strong, nonatomic) UIWindow *window;

@end
