//
//  TUIFilters.h
//  Radar
//
//  Created by jmartin on 24/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"

@interface TUIFilters : TUIBaseModel

/**
 The filter indexes
 */
@property (nonatomic) NSUInteger weatherFilterIndex;
@property (nonatomic) NSUInteger timeFilterIndex;
@property (nonatomic) NSUInteger distanceFilterIndex;

/**
 The filter images
 */
@property (nonatomic, strong) NSString *weatherFilterIconImage;
@property (nonatomic, strong) NSString *timeFilterIconImage;
@property (nonatomic, strong) NSString *distanceFilterIconImage;

/**
 The titles
 */
@property (nonatomic, copy) NSString *weatherFilterLabel;
@property (nonatomic, copy) NSString *timeFilterLabel;
@property (nonatomic, copy) NSString *distanceFilterLabel;


@property (nonatomic, copy) NSString *lastPageViewControllerChanged;


/**
 @methodName currentSettings
 @abstract Returns the filters corresponding to the current settings
 @discussion This method creates reads the TUISettings singleton and creates
 a set of filters based on it
 
 @return The filters corresponding with the current settings.
 */
+ (TUIFilters *)currentFilters;


@end
