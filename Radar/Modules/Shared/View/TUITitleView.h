//
//  TUITitleView.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseView.h"
#import "TUIBaseLabel.h"


/**
 TUITitleView is a TUIBaseView which is designed to be displayed as a
 UINavigationItem titleView property
 */
@interface TUITitleView : TUIBaseView

/**
 The title label
 */
@property (nonatomic, strong, readonly) TUIBaseLabel *titleLabel;

/**
 The subtitle label
 */
@property (nonatomic, strong, readonly) TUIBaseLabel *subtitleLabel;

/**
 @methodName titleView
 @abstract Return a TUITitleView instance ready for display
 @discussion This is a convenience method to return a TUITitleView
 with a frame set ready to display in a UINavigationItem
 
 @return a TUITitleView instance with it's frame set ready to display
 */
+ (instancetype)titleView;

@end
