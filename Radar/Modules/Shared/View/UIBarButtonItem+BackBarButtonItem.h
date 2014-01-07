//
//  UIBarButtonItem+BackBarButtonItem.h
//  laterooms
//
//  Created by Alex Fish on 9/10/13.
//  Copyright (c) 2013 ustwo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIBarButtonItem+BackBarButtonItem is a category on UIBarButtonItem which provides
 methods to create laterooms specific UIBarButtonItems
 */
@interface UIBarButtonItem (BackBarButtonItem)

/**
 @methodName backBarButtonItemWithTarget:
 @abstract Return a new back bar button instance
 @discussion This method will return back bar button item with laterooms styling
 which should be used as a back button in a navigationItem
 
 @param target The target for the back button
 @param action The action for the back button
 
 @return A new UIBarButtonItem instance
 */
+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target action:(SEL)action;

@end
