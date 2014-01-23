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
// Models
#import "TUISettings.h"
#import "TUICache.h"

// Layout
static const CGFloat kWeatherViewHeight     = 80.0;
static const CGFloat kLocationViewHeight    = 160.0;
static const CGFloat kTimeViewHeight        = 160.0;
static const CGFloat kKeyboardShownRatio    = 0.7;

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
@property (nonatomic, strong) TUISettingsWeatherView *weatherView;

/**
 The location view
 */
@property (nonatomic, strong) TUISettingsLocationView *locationView;

/**
 The time view
 */
@property (nonatomic, strong) TUISettingsTimeView *timeView;

/**
 The settings object
 */
@property (nonatomic, strong) TUISettings *settings;

@end

@implementation TUISettingsViewController

#pragma mark - Initilialize data -

- (void)initData
{
    [super initData];
    
    _settings = [TUISettings currentSettings];
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
    // Register for keyboard notifications
    [self registerForKeyboardNotifications];
}

- (void)addWeatherView
{
    _weatherView = [[TUISettingsWeatherView alloc] initWithFrame:CGRectMake(ZERO_FLOAT, NAVIGATION_BAR_HEIGHT_IOS6, SCREEN_WIDTH, kWeatherViewHeight)];
    //Get weather from settings
    for (NSUInteger i=0; i<_weatherView.weatherSegmentedControl.numberOfSegments; i++)
    {
        if ([[_weatherView.weatherSegmentedControl titleForSegmentAtIndex:i] isEqualToString:_settings.weather])
        {
            _weatherView.weatherSegmentedControl.selectedSegmentIndex = i;
        }
    }
    
    [self.view addSubview:_weatherView];
}

- (void)addLocationView
{
    _locationView = [[TUISettingsLocationView alloc] initWithFrame:CGRectMake(ZERO_FLOAT, _weatherView.y + _weatherView.height, SCREEN_WIDTH, kLocationViewHeight)];
    // Get data from settings
    _locationView.automaticLocationSwitch.on = [_settings.autolocation boolValue];
    _locationView.latitudeTextField.text = [_settings.latitude stringValue];
    _locationView.longitudeTextField.text = [_settings.longitude stringValue];
    // Add targets and actions
    [_locationView.automaticLocationSwitch addTarget:self action:@selector(autolocationSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_locationView];
}

- (void)addTimeView
{
    _timeView = [[TUISettingsTimeView alloc] initWithFrame:CGRectMake(ZERO_FLOAT, _locationView.y + _locationView.height, SCREEN_WIDTH, kTimeViewHeight)];
    // Get data from settings
    _timeView.automaticTimeSwitch.on = [_settings.autotime boolValue];
    _timeView.timeTextField.text = _settings.time;
    // Add targets and actions
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
    [self updateSettings];
    [_settings persist];
    [_delegate saveButtonPressed];
}

- (void)cancelButtonClicked:(id)sender
{
    [_delegate cancelButtonPressed];
}


#pragma mark - Keyboard -

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // Animate the current view out of the way
    if (self.view.y >= ZERO_INT)
    {
        [self setViewMovedUp:YES withKeyboardSize:keyboardSize];
    }
    else if (self.view.y < ZERO_INT)
    {
        [self setViewMovedUp:NO withKeyboardSize:keyboardSize];
    }
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    if (self.view.frame.origin.y >= ZERO_INT)
    {
        [self setViewMovedUp:YES withKeyboardSize:keyboardSize];
    }
    else if (self.view.frame.origin.y < ZERO_INT)
    {
        [self setViewMovedUp:NO withKeyboardSize:keyboardSize];
    }
}

- (void)setViewMovedUp:(BOOL)movedUp withKeyboardSize:(CGSize)keyboardSize
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:DEFAULT_ANIMATION_SPEED]; // if you want to slide up the view
    
    CGFloat scrollup = kKeyboardShownRatio * keyboardSize.height;
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= scrollup;
        rect.size.height += scrollup;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += scrollup;
        rect.size.height -= scrollup;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

#pragma mark - Update Settings -
- (void)updateSettings
{
    _settings.weather = [_weatherView.weatherSegmentedControl titleForSegmentAtIndex:_weatherView.weatherSegmentedControl.selectedSegmentIndex];
    _settings.autolocation = [NSNumber numberWithBool:_locationView.automaticLocationSwitch.on];
    _settings.latitude = [NSNumber numberWithDouble:[_locationView.latitudeTextField.text doubleValue]];
    _settings.longitude = [NSNumber numberWithDouble:[_locationView.longitudeTextField.text doubleValue]];
    _settings.autotime = [NSNumber numberWithBool:_timeView.automaticTimeSwitch.on];
    _settings.time = _timeView.timeTextField.text;
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
