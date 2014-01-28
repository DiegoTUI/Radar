//
//  UIColor+TUIColors.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#define RGB(r, g, b) \
[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, a) \
[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

/**
 A UIColor category to supply late rooms specific UIColors
 */
@interface UIColor (TUIColors)

/**
 @methodName bodyTextColor
 @abstract Returns a UIColor for body text
 @discussion This method will return a UIColor object designed for body text
 R87, G87, B87
 
 @return A UIColor instance for body text
 */
+ (UIColor *)bodyTextColor;

/**
 @methodName tuiLightGreenColor
 @abstract Returns a UIColor for TUI pins in maps and side views in cells
 @discussion This method will return a UIColor object designed for TUI pins in maps and side views in cells
 R160, G200, B0
 
 @return A UIColor instance for white backgrounds
 */
+ (UIColor *)tuiLightGreenColor;

/**
 @methodName tuiLightBlueColor
 @abstract Returns the foursquare light blue
 @discussion This will return a UIColor object set to the foursquare light blue
 R72, G190, B240
 
 @return A UIColor calibrated to the Radar purple color
 */
+ (UIColor *)tuiLightBlueColor;

/**
 @methodName tuiLightGrayColor
 @abstract Returns a UIColor for TUI pins in maps and side views in cells
 @discussion This method will return a UIColor object designed for TUI pins in maps and side views in cells
 R216, G216, B216
 @return A UIColor instance for white backgrounds
 */
+ (UIColor *)tuiLightGrayColor;

/**
 @methodName tuiDisabledCellBackgroundColor
 @abstract Returns a UIColor for the disabled table cells
 @discussion This method will return a UIColor object designed for for the disabled table cells
 R240, G240, B240
 @return A UIColor instance for white backgrounds
 */
+ (UIColor *)tuiDisabledCellBackgroundColor;



@end
