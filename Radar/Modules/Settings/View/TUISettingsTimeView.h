//
//  TUISettingsTimeView.h
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseView.h"


/**
 A view with a title a switch and a date picker
 */
@interface TUISettingsTimeView : TUIBaseView

/**
 Switch for the automatic time
 */
@property (nonatomic, strong, readonly) UISwitch *automaticTimeSwitch;

/**
 Date picker to select the time
 */
@property (nonatomic, strong, readonly) UITextField *timeTextField;

@end
