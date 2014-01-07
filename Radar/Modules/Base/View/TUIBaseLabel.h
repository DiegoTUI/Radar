//
//  TUIBaseLabel.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseView.h"

/**
 TUIBaseLabel is a base class which all UILabel classes should be subclassed from
 */
@interface TUIBaseLabel : UILabel

/**
 @methodName setKerning
 @abstract Set the labels kerning value
 @discussion This method will set the labels kerning value for
 the text it is currently displaying. If the text is updated then this
 value will need to be set again to apply kerning to the new text.
 
 @param kerning The kerning value to set
 */
- (void)setKerning:(CGFloat)kerning;

/**
 @methodName actualText
 @abstract The text which is currently visible in the label
 @discussion This method will calculate and return the text
 that is currently displayed and visible in the label. This
 allows you to return the truncated string and not the full
 string which is returned in the text property.
 
 @return The actual text
 */
- (NSString *)actualText;

@end
