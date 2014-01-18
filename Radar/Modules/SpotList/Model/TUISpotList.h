//
//  TUISpotList.h
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"

/**
 The TUISpotList model represents a list of TUISpots
 */
@interface TUISpotList : TUIBaseModel

/**
 The TUISpots
 */
@property (nonatomic, strong) NSOrderedSet *spots;

@end
