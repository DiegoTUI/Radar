//
//  TUISettingsWeatherView.m
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISettingsWeatherView.h"
// Extensions
#import "TUIBaseView_Private.h"
// Views
#import "TUIBaseLabel.h"

// Layout
static const CGFloat kTitleLabelWidth       = 125.0;
static const CGFloat kTitleLabelHeight      = 21.0;

@interface TUISettingsWeatherView ()

/**
 The title of the view
 */
@property (nonatomic, strong) TUIBaseLabel *title;

@end

@implementation TUISettingsWeatherView


#pragma mark - Setup

- (void)setup
{
    [super setup];
    
    [self addTitle];
    [self addWeatherControl];
}

- (void)addTitle
{
    _title = [[TUIBaseLabel alloc] initWithFrame:CGRectMake(DEFAULT_MARGIN, DEFAULT_MARGIN, kTitleLabelWidth, kTitleLabelHeight)];
    _title.text = NSLocalizedString(@"WEATHER_VIEW_TITLE", nil);
    [self addSubview:_title];
}

- (void)addWeatherControl
{
    _weatherSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[NSLocalizedString(@"WEATHER_VIEW_SUNNY", nil),
                                                                          NSLocalizedString(@"WEATHER_VIEW_CLOUDY", nil)]];
    _weatherSegmentedControl.x = (SCREEN_WIDTH - _weatherSegmentedControl.width) / TWO_INT;
    _weatherSegmentedControl.y = TWO_INT * DEFAULT_MARGIN + kTitleLabelHeight;
    [self addSubview:_weatherSegmentedControl];
}


#pragma mark - Accessibility

- (void)setupAccessibility
{
    [super setupAccessibility];
    _weatherSegmentedControl.accessibilityLabel = ACCESSIBILITY_WEATHER_SEGMENTED_CONTROL;
    _weatherSegmentedControl.isAccessibilityElement = YES;
}


@end
