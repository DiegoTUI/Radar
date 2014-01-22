//
//  UIAlertView+TUIError.h
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

/**
 UIAlertView+TUIError is a category of UIAlertView which can perform late rooms specfic
 UIAlertView logic
 */
@interface UIAlertView (TUIError)

/**
 @methodName showWithError:
 @abstract Show an alert view with a specific error
 @discussion This method will create and display a UIAlertView intance, the NSError object's
 NSLocalizedFailureReasonErrorKey userInfo key will be used for the alert views body text.
 
 @param error The error to display
 @param delegate The delegate for the alertView
 */
+ (void)showWithError:(NSError *)error
             delegate:(id <UIAlertViewDelegate>)delegate;

@end
