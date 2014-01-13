//
//  UIBarButtonItem+BackBarButtonItem.h
//  Radar
//
//  Created by Alex Fish on 9/10/13.
//  Copyright (c) 2014 TUI Travel A&D. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIBarButtonItem+BackBarButtonItem is a category on UIBarButtonItem which provides
 methods to create Radar specific UIBarButtonItems
 */
@interface UIBarButtonItem (BackBarButtonItem)

/**
 @methodName backBarButtonItemWithTarget:
 @abstract Return a new back bar button instance
 @discussion This method will return back bar button item with Radar styling
 which should be used as a back button in a navigationItem
 
 @param target The target for the back button
 @param action The action for the back button
 
 @return A new UIBarButtonItem instance
 */
+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target action:(SEL)action;

@end
