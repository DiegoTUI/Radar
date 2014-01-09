//
//  TUISettingsWeatherView.h
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseView.h"

/**
 A view with a title and a segmented control
 */
@interface TUISettingsWeatherView : TUIBaseView

/**
 The segmented control storing the weather
 */
@property (nonatomic, strong, readonly) UISegmentedControl *weatherSegmentedControl;

@end
