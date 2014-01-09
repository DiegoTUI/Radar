//
//  TUISettingsLocationView.h
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseView.h"

/**
 A view with a title a switch and with latitude and longitude text fields
 */
@interface TUISettingsLocationView : TUIBaseView

/**
 Switch for the automatic location
 */
@property (nonatomic, strong, readonly) UISwitch *automaticLocationSwitch;

/**
 Text field for the latitude
 */
@property (nonatomic, strong, readonly) UITextField *latitudeTextField;

/**
 Text field for the longitude
 */
@property (nonatomic, strong, readonly) UITextField *longitudeTextField;

@end
