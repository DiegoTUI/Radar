//
//  UIBarButtonItem+BackBarButtonItem.m
//  Radar
//
//  Created by Alex Fish on 9/10/13.
//  Copyright (c) 2013 ustwo. All rights reserved.
//

#import "UIBarButtonItem+BackBarButtonItem.h"

@implementation UIBarButtonItem (BackBarButtonItem)


#pragma mark - Back button

+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:@"images/shared/shared_navigation_bar_button_back_default.png"];
    UIImage *altImage = [UIImage imageNamed:@"images/shared/shared_navigation_bar_button_back_highlight.png"];
    
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.isAccessibilityElement = YES;
    backButton.accessibilityLabel = ACCESSIBILITY_BACK_BUTTON;
    
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:altImage forState:UIControlStateHighlighted];
    [backButton setFrame:CGRectMake(ZERO_ORIGIN, ZERO_ORIGIN, width + DEFAULT_MARGIN, height)];
    
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

@end
