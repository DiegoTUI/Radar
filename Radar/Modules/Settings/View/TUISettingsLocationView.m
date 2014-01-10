//
//  TUISettingsLocationView.m
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISettingsLocationView.h"
// Extensions
#import "TUIBaseView_Private.h"
// Views
#import "TUIBaseLabel.h"

// Layout
static const CGFloat kLabelWidth                = 180.0;
static const CGFloat kLabelHeight               = 21.0;
static const CGFloat kLocationLabelWidth        = 90.0;
static const CGFloat kLocationLabelHeight       = 21.0;
static const CGFloat kSwitchWidth               = 20.0;
static const CGFloat kSwitchHeight              = 10.0;
static const CGFloat kTextFieldWidth            = 120.0;
static const CGFloat kTextFieldHeight           = 21.0;

// Font
static const CGFloat kBodyLabelFontSize    = 14;

@interface  TUISettingsLocationView ()

/**
 The title of the view
 */
@property (nonatomic, strong) TUIBaseLabel *title;

/**
 The autolocation label
 */
@property (nonatomic, strong) TUIBaseLabel *autolocationLabel;

/**
 The latitude label
 */
@property (nonatomic, strong) TUIBaseLabel *latitudeLabel;

/**
 The longitude label
 */
@property (nonatomic, strong) TUIBaseLabel *longitudeLabel;

@end

@implementation TUISettingsLocationView

#pragma mark - Setup

- (void)setup
{
    [super setup];
    
    [self addTitle];
    [self addAutolocation];
    [self addLocationElements];
}

- (void)addTitle
{
    _title = [[TUIBaseLabel alloc] initWithFrame:CGRectMake(DEFAULT_MARGIN, DEFAULT_MARGIN, kLabelWidth, kLabelHeight)];
    _title.text = NSLocalizedString(@"LOCATION_VIEW_TITLE", nil);
    [self addSubview:_title];
}

- (void)addAutolocation
{
    // Label
    _autolocationLabel = [[TUIBaseLabel alloc] initWithFrame:CGRectMake(TWO_INT * DEFAULT_MARGIN,
                                                                        _title.y + _title.height + DEFAULT_MARGIN,
                                                                        kLabelWidth,
                                                                        kLabelHeight)];
    [_autolocationLabel setFont:[UIFont fontWithName:BOLD_FONT size:kBodyLabelFontSize]];
    _autolocationLabel.text = NSLocalizedString(@"AUTOLOCATION_LABEL", nil);
    [self addSubview:_autolocationLabel];
    // Switch
    _automaticLocationSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(_autolocationLabel.x + _autolocationLabel.width + DEFAULT_MARGIN,
                                                                         _autolocationLabel.y,
                                                                          kSwitchWidth,
                                                                          kSwitchHeight)];
    [self addSubview:_automaticLocationSwitch];
}

- (void) addLocationElements
{
    // Latitude Label
    _latitudeLabel = [[TUIBaseLabel alloc] initWithFrame:CGRectMake(TWO_INT * DEFAULT_MARGIN,
                                                                    _autolocationLabel.y + _autolocationLabel.height + TWO_INT * DEFAULT_MARGIN,
                                                                    kLocationLabelWidth,
                                                                    kLocationLabelHeight)];
    [_latitudeLabel setFont:[UIFont fontWithName:BOLD_FONT size:kBodyLabelFontSize]];
    _latitudeLabel.text = NSLocalizedString(@"LATITUDE_LABEL", nil);
    [self addSubview:_latitudeLabel];
    // Latitude Text Field
    _latitudeTextField = [[UITextField alloc] initWithFrame:CGRectMake(_latitudeLabel.x + _latitudeLabel.width + DEFAULT_MARGIN,
                                                                       _latitudeLabel.y,
                                                                       kTextFieldWidth,
                                                                       kTextFieldHeight)];
    _latitudeTextField.borderStyle = UITextBorderStyleRoundedRect;
    _latitudeTextField.keyboardType = UIKeyboardTypeDecimalPad;
    [self addSubview:_latitudeTextField];
    // Longitude Label
    _longitudeLabel = [[TUIBaseLabel alloc] initWithFrame:CGRectMake(TWO_INT * DEFAULT_MARGIN,
                                                                    _latitudeLabel.y + _latitudeLabel.height + DEFAULT_MARGIN,
                                                                    kLocationLabelWidth,
                                                                    kLocationLabelHeight)];
    [_longitudeLabel setFont:[UIFont fontWithName:BOLD_FONT size:kBodyLabelFontSize]];
    _longitudeLabel.text = NSLocalizedString(@"LONGITUDE_LABEL", nil);
    [self addSubview:_longitudeLabel];
    // Longitude Text Field
    _longitudeTextField = [[UITextField alloc] initWithFrame:CGRectMake(_longitudeLabel.x + _longitudeLabel.width + DEFAULT_MARGIN,
                                                                       _longitudeLabel.y,
                                                                       kTextFieldWidth,
                                                                       kTextFieldHeight)];
    _longitudeTextField.borderStyle = UITextBorderStyleRoundedRect;
    _longitudeTextField.keyboardType = UIKeyboardTypeDecimalPad;
    [self addSubview:_longitudeTextField];
}

@end
