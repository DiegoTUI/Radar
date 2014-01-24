//
//  TUIFIlters.h
//  Radar
//
//  Created by jmartin on 24/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"

@interface TUIFIlters : TUIBaseModel

/**
 The autolocation switch.
 */
@property (nonatomic) NSUInteger weatherFilterIndex;
@property (nonatomic) NSUInteger timeFilterIndex;
@property (nonatomic) NSUInteger distanceFilterIndex;

/**
 The latitude
 */
@property (nonatomic, strong) NSString *weatherFilterIconImage;
@property (nonatomic, strong) NSString *timeFilterIconImage;
@property (nonatomic, strong) NSString *distanceFilterIconImage;

/**
 The longitude
 */
@property (nonatomic, copy) NSString *weatherFilterLabel;
@property (nonatomic, copy) NSString *timeFilterLabel;
@property (nonatomic, copy) NSString *distanceFilterLabel;


@property (nonatomic, copy) NSString *lastPageViewCOntrollerChanged;


/**
 @methodName defaultSettings
 @abstract Creates a default TUISettings object
 @discussion This method creates and returns a default TUISettings object
 
 @return A default TUIFIlters object.
 */
+ (TUIFIlters *)defaultSettings;

/**
 @methodName description
 @abstract Return a string with all TUIFIlters object values
 @discussion This method returns a string with all TUIFIlters object values.
 
 @return A string with all TUIFIlters object values.
 */
- (NSString *)toString;


@end
