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
 @methodName defaultSettings
 @abstract Creates a default TUISettings object
 @discussion This method creates and returns a default TUISettings object
 
 @return A default TUIFilters object.
 */
+ (TUIFilters *)defaultSettings;


@end
