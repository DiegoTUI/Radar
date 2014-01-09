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
 @methodName titleTextColor
 @abstract Returns a UIColor for title text
 @discussion This method will return a UIColor object designed for title text
 R27, G27, B27
 
 @return A UIColor instance for title text
 */
+ (UIColor *)titleTextColor;

/**
 @methodName whiteBackgroundColor
 @abstract Returns a UIColor for white backgrounds
 @discussion This method will return a UIColor object designed for white backgrounds
 R251, G251, B251
 
 @return A UIColor instance for white backgrounds
 */
+ (UIColor *)whiteBackgroundColor;

/**
 @methodName lateroomsDownStateWhiteColor
 @abstract Returns a UIColor for white text's down states
 @discussion This method will return a UIColor object designed for white text's down states
 R255, G255, B255, A80%
 
 @return A UIColor instance for white backgrounds
 */
+ (UIColor *)lateroomsDownStateWhiteColor;

/**
 @methodName lateroomsPurpleColor
 @abstract Returns the Radar purple color
 @discussion This will return a UIColor object set to the Radar purple color
 R65, G20, B133
 
 @return A UIColor calibrated to the Radar purple color
 */
+ (UIColor *)lateroomsPurpleColor;

/**
 @methodName lateroomsBlueColor
 @abstract Returns the Radar blue color
 @discussion This will return a UIColor object set to the Radar blue color
 R50, G160, B228
 
 @return A UIColor calibrated to the Radar purple color
 */
+ (UIColor *)lateroomsBlueColor;

/**
 @methodName lateroomsRedColor
 @abstract Returns the Radar red color
 @discussion This will return a UIColor object set to the Radar red color
 R230, G23, B92
 
 @return A UIColor calibrated to the Radar red color
 */
+ (UIColor *)lateroomsRedColor;

/**
 @methodName lateroomsRedCacelledColor
 @abstract Returns the Radar red cancelled color
 @discussion This will return a UIColor object set to the Radar red cancelled color
 R251, G54, B54
 
 @return A UIColor calibrated to the Radar red color
 */
+ (UIColor *)lateroomsRedCancelledColor;

/**
 @methodName borderLightGreyColor
 @abstract Returns the border light grey color
 @discussion This will return a UIColor object set to the border light grey color
 R219, G219, B222
 
 @return A UIColor calibrated to the room detail light grey color
 */
+ (UIColor *)borderLightGreyColor;

/**
 @methodName promptGreyColor
 @abstract Returns the prompt grey color
 @discussion This will return a UIColor object set to the prompt grey color
 R113, G113, B113
 
 @return A UIColor calibrated to the prompt grey color
 */
+ (UIColor *)promptGreyColor;

/**
 @methodName greyBorderColor
 @abstract Returns the grey border color
 @discussion This will return a UIColor object set to the grey border color
 R233, G230, B230
 
 @return A UIColor calibrated to the grey border color
 */
+ (UIColor *)greyBorderColor;

/**
 @methodName borderRedColor
 @abstract Returns the grey border color
 @discussion This will return a UIColor object set to the grey border color
 R233, G230, B230
 
 @return A UIColor calibrated to the grey border color
 */
+ (UIColor *)borderRedColor;

/**
 @methodName errorRedColor
 @abstract Returns the grey border color
 @discussion This will return a UIColor object set to the grey border color
 R233, G230, B230
 
 @return A UIColor calibrated to the grey border color
 */
+ (UIColor *)errorRedColor;

/**
 @methodName stickyBarYellowColor
 @abstract Returns the sticky bar yellow color
 @discussion This will return a UIColor object the sticky bar yellow color
 R255, G239, B189
 
 @return A UIColor calibrated to the sticky bar yellow color
 */
+ (UIColor *)lightYellowColor;

/**
 @methodName stickyBarYellowColor
 @abstract Returns the dark yellow color
 @discussion This will return a UIColor object the dark yellow color
 R251, G198, B1
 
 @return A UIColor calibrated to the dark yellow color
 */
+ (UIColor *)darkYellowColor;

/**
 @methodName altDarkYellowColor
 @abstract Returns the alt dark yellow color
 @discussion This will return a UIColor object the alt dark yellow color
 R213, G169, B36
 
 @return A UIColor calibrated the alt dark yellow color
 */
+ (UIColor *)altDarkYellowColor;

/**
 @methodName lightPurpleColor
 @abstract Returns the light purple color
 @discussion This will return a UIColor object the light purple color
 R198, G184, B218
 
 @return A UIColor calibrated the light purple color
 */
+ (UIColor *)lightPurpleColor;

/**
 @methodName lateroomsBlueButtonColor
 @abstract Returns the blue button color
 @discussion This will return a UIColor object the blue button color
 R57, G156, B218
 
 @return A UIColor calibrated the blue button color
 */
+ (UIColor *)lateroomsBlueButtonColor;


/**
 @methodName altLateroomsBlueButtonColor
 @abstract Returns the alt blue button color
 @discussion This will return a UIColor object the alt blue button color
 R57, G156, B218
 
 @return A UIColor calibrated the alt blue button color
 */
+ (UIColor *)altLateroomsBlueButtonColor;

/**
 @methodName shadowColor
 @abstract Returns the shadow line color
 @discussion This will return a UIColor object the alt blue button color
 R27, G27, B27, A0.1
 
 @return A UIColor calibrated the alt blue button color
 */
+ (UIColor *)shadowColor;

/**
 @methodName lateroomsLightGreyCellColor
 @abstract Returns the background color for light grey cell
 R241, G241, B241
 
 @return A UIColor calibrated the light grey cell color
 */
+ (UIColor *)lateroomsLightGreyCellColor;

/**
 @methodName lateroomsLightGreyCellColorTransparent
 @abstract Returns the background color for light grey cell
 R241, G241, B241, A96%
 
 @return A UIColor calibrated the light grey cell color
 */
+ (UIColor *)lateroomsLightGreyCellColorTransparent;

/**
 @methodName lateroomsGreyDefaultButtonBackgroundColor
 @abstract Returns the background color for the grey background of a button
 R246, G246, B246
 
 @return A UIColor calibrated the grey background of a button
 */
+ (UIColor *)lateroomsGreyDefaultButtonBackgroundColor;

/**
 @methodName lateroomsNavigationBarTextFieldDisabledBackgroundColor
 @abstract Returns the background color for a disabled text field embedded in the navigation bar.
 @return A UIColor calibrated the light grey cell color
 */
+ (UIColor *)lateroomsNavigationBarTextFieldDisabledBackgroundColor;

/**
 @methodName lateroomsNavigationBarTextFieldDisabledTextColorColor
 @abstract Returns the text color for a disabled text field embedded in the navigation bar.
 @return A UIColor calibrated the light grey cell color
 */
+ (UIColor *)lateroomsNavigationBarTextFieldDisabledTextColorColor;

/**
 @methodName modalFooterBackgroundColor
 @abstract the modal view controller footer background color
 @discussion Returns the background color for modal view controller footer views,
 R190, G188, B174
 
 @return A UIColor calibrated to the modal footer background color
 */
+ (UIColor *)modalFooterBackgroundColor;

@end
