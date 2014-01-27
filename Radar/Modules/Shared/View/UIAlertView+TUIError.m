//
//  UIAlertView+TUIError.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "UIAlertView+TUIError.h"

@implementation UIAlertView (TUIError)

#pragma mark - Display

+ (void)showWithError:(NSError *)error delegate:(id <UIAlertViewDelegate>)delegate
{
    NSString *errorMessage = [error.userInfo objectForKey:NSLocalizedFailureReasonErrorKey];
    NSString *errorTitle = [error.userInfo objectForKey:NSLocalizedDescriptionKey];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:errorTitle message:errorMessage delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
    
    
    if (delegate)
    {
        alertView.delegate = delegate;
    }
    
    [alertView show];
}

@end
