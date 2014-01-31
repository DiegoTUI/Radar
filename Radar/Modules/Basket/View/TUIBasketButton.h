//
//  TUIBasketButton.h
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseButton.h"

/**
 A model of the basket button to be placed in the navigation bar
 */
@interface TUIBasketButton : TUIBaseButton

/**
 @methodName initAsBarButton
 @abstract Inits the button to be embedded in a UIBarButton
 @discussion This method will init the button to be embedded in a UIBarButton
 
 @return The initialized TUIBasketButton
 */
- (TUIBasketButton *)initAsBarButton;

/**
 @methodName showCounterAnimatedWithText:
 @abstract Shows the counter label with an animation displaying the given text
 @discussion This method will show the counter with the given text. If the counter
 was hidden it animates it from the center. If it was showing, it shakes it.
 
 @param text The text to show in the counter
 */
- (void)showCounterAnimatedWithText:(NSString *)text;


/**
 @methodName hideCounterAnimated
 @abstract Hides the counter with an animation
 @discussion This method will hides the counter with an animation
 */
- (void)hideCounterAnimated;

@end
