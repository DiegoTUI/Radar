//
//  TUIDeveloperSettingsViewController.m
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISettingsViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"
// Views
#import "TUISettingsWeatherView.h"
#import "TUISettingsLocationView.h"
#import "TUISettingsTimeView.h"

// Layout
static const CGFloat kWeatherViewHeight      = 80.0;
static const CGFloat kLocationViewHeight     = 160.0;
static const CGFloat kTimeViewHeight        = 160.0;

@interface TUISettingsViewController ()

/**
 The navigation bar
 */
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;

/**
 The save button
 */
@property (strong, nonatomic) UIButton *saveButton;

/**
 The cancel button
 */
@property (strong, nonatomic) UIButton *cancelButton;

/**
 The weather view
 */
@property (nonatomic, strong, readonly) TUISettingsWeatherView *weatherView;

/**
 The location view
 */
@property (nonatomic, strong, readonly) TUISettingsLocationView *locationView;

/**
 The time view
 */
@property (nonatomic, strong, readonly) TUISettingsTimeView *timeView;

@end

@implementation TUISettingsViewController

#pragma mark - Initilialize data -

- (void)initData
{
    [super initData];
}


#pragma mark - Initilialize user interface -

- (void)initUserInterface
{
    [super initUserInterface];
    // Add views
    _navigationBar.topItem.title = NSLocalizedString(@"SETTINGS_TITLE", nil);
    [self addWeatherView];
    [self addLocationView];
    [self addTimeView];
    [self addButtons];
    // Update views
    [self updateLocationView];
    [self updateTimeView];
}

- (void)addWeatherView
{
    _weatherView = [[TUISettingsWeatherView alloc] initWithFrame:CGRectMake(ZERO_FLOAT, NAVIGATION_BAR_HEIGHT_IOS6, SCREEN_WIDTH, kWeatherViewHeight)];
    [self.view addSubview:_weatherView];
}

- (void)addLocationView
{
    _locationView = [[TUISettingsLocationView alloc] initWithFrame:CGRectMake(ZERO_FLOAT, _weatherView.y + _weatherView.height, SCREEN_WIDTH, kLocationViewHeight)];
    [_locationView.automaticLocationSwitch addTarget:self action:@selector(autolocationSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_locationView];
}

- (void)addTimeView
{
    _timeView = [[TUISettingsTimeView alloc] initWithFrame:CGRectMake(ZERO_FLOAT, _locationView.y + _locationView.height, SCREEN_WIDTH, kTimeViewHeight)];
    [_timeView.automaticTimeSwitch addTarget:self action:@selector(autotimeSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_timeView];
}

- (void)addButtons
{
    // Save button
    _saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_saveButton setTitle:NSLocalizedString(@"SAVE_BUTTON", nil) forState:UIControlStateNormal];
    [_saveButton sizeToFit];
    _saveButton.x = SCREEN_WIDTH - _saveButton.width - TWO_INT * DEFAULT_MARGIN;
    _saveButton.y = SCREEN_HEIGHT - _saveButton.height - DEFAULT_MARGIN;
    [_saveButton addTarget:self action:@selector(saveButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_saveButton];
    // Cancel button
    _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_cancelButton setTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) forState:UIControlStateNormal];
    [_cancelButton sizeToFit];
    _cancelButton.x = TWO_INT * DEFAULT_MARGIN;
    _cancelButton.y = _saveButton.y;
    [_cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_cancelButton];
}


#pragma mark - Control targets -

- (void)autolocationSwitchChanged:(id)sender
{
    [self updateLocationView];
}

- (void)autotimeSwitchChanged:(id)sender
{
    [self updateTimeView];
}

- (void)saveButtonClicked:(id)sender
{
}

- (void)cancelButtonClicked:(id)sender
{
}


#pragma mark - Update Views -

- (void)updateLocationView
{
    if (_locationView.automaticLocationSwitch.on)
    {
        // disable text fields
        _locationView.latitudeTextField.enabled = NO;
        _locationView.longitudeTextField.enabled = NO;
    }
    else
    {
        // enable text field
        _locationView.latitudeTextField.enabled = YES;
        _locationView.longitudeTextField.enabled = YES;
    }
}

- (void)updateTimeView
{
    if (_timeView.automaticTimeSwitch.on)
    {
        // disable text fields
        _timeView.timeTextField.enabled = NO;
    }
    else
    {
        // enable text field
        _timeView.timeTextField.enabled = YES;
    }
}

@end
