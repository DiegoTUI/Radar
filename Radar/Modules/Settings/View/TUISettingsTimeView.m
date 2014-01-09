//
//  TUISettingsTimeView.m
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISettingsTimeView.h"
// Extensions
#import "TUIBaseView_Private.h"
// Views
#import "TUIBaseLabel.h"

// Layout
static const CGFloat kLabelWidth                = 180.0;
static const CGFloat kLabelHeight               = 21.0;
static const CGFloat kTimeLabelWidth            = 120.0;
static const CGFloat kTimeLabelHeight           = 21.0;
static const CGFloat kSwitchWidth               = 20.0;
static const CGFloat kSwitchHeight              = 10.0;
static const CGFloat kTextFieldWidth            = 80.0;
static const CGFloat kTextFieldHeight           = 21.0;

// Font
static const CGFloat kBodyLabelFontSize    = 14;

@interface TUISettingsTimeView()

/**
 The title of the view
 */
@property (nonatomic, strong) TUIBaseLabel *title;

/**
 The autotime label
 */
@property (nonatomic, strong) TUIBaseLabel *autotimeLabel;

/**
 The time label
 */
@property (nonatomic, strong) TUIBaseLabel *timeLabel;

@end

@implementation TUISettingsTimeView

#pragma mark - Setup

- (void)setup
{
    [super setup];
    
    [self addTitle];
    [self addAutotime];
    [self addTimeElements];
}

- (void)addTitle
{
    _title = [[TUIBaseLabel alloc] initWithFrame:CGRectMake(DEFAULT_MARGIN, DEFAULT_MARGIN, kLabelWidth, kLabelHeight)];
    _title.text = NSLocalizedString(@"TIME_VIEW_TITLE", nil);
    [self addSubview:_title];
}

- (void)addAutotime
{
    // Label
    _autotimeLabel = [[TUIBaseLabel alloc] initWithFrame:CGRectMake(TWO_INT * DEFAULT_MARGIN,
                                                                        _title.y + _title.height + DEFAULT_MARGIN,
                                                                        kLabelWidth,
                                                                        kLabelHeight)];
    [_autotimeLabel setFont:[UIFont fontWithName:BOLD_FONT size:kBodyLabelFontSize]];
    _autotimeLabel.text = NSLocalizedString(@"AUTOTIME_LABEL", nil);
    [self addSubview:_autotimeLabel];
    // Switch
    _automaticTimeSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(_autotimeLabel.x + _autotimeLabel.width + DEFAULT_MARGIN,
                                                                          _autotimeLabel.y,
                                                                          kSwitchWidth,
                                                                          kSwitchHeight)];
    [self addSubview:_automaticTimeSwitch];
}

- (void)addTimeElements
{
    // Label
    _timeLabel = [[TUIBaseLabel alloc] initWithFrame:CGRectMake(TWO_INT * DEFAULT_MARGIN,
                                                                    _autotimeLabel.y + _autotimeLabel.height + TWO_INT * DEFAULT_MARGIN,
                                                                    kTimeLabelWidth,
                                                                    kTimeLabelHeight)];
    [_timeLabel setFont:[UIFont fontWithName:BOLD_FONT size:kBodyLabelFontSize]];
    _timeLabel.text = NSLocalizedString(@"TIME_LABEL", nil);
    [self addSubview:_timeLabel];
    // Text field
    _timeTextField = [[UITextField alloc] initWithFrame:CGRectMake(_timeLabel.x + _timeLabel.width + DEFAULT_MARGIN,
                                                                       _timeLabel.y,
                                                                       kTextFieldWidth,
                                                                       kTextFieldHeight)];
    _timeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:_timeTextField];
    
}

@end
