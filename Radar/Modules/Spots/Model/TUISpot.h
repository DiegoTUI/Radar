//
//  TUISpot.h
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"
#import <CoreLocation/CoreLocation.h>

/**
 The TUISpot model represents a spot in a map (activity, ticket, venue)
 */
@interface TUISpot : TUIBaseModel

/**
 The spots ID
 */
@property (nonatomic, copy) NSString *_id;

/**
 The spots name
 */
@property (nonatomic, copy) NSString *name;

/**
 The spots description
 */
@property (nonatomic, copy) NSString *descriptionBody;

/**
 The spots location
 */
@property (nonatomic, strong) CLLocation *location;

/**
 The spots images
 */
@property (nonatomic, strong) NSOrderedSet *imageURLs;

@end
