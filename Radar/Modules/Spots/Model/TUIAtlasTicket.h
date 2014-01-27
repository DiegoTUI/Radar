//
//  TUIAtlasTicket.h
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpot.h"

/**
 The TUIAtlasTicket model represents an Atlas activity
 */
@interface TUIAtlasTicket : TUISpot

/**
 The indoor flag
 */
@property (nonatomic, strong) NSNumber *indoor;

/**
 The morning flag
 */
@property (nonatomic, strong) NSNumber *morning;

/**
 The afternoon flag
 */
@property (nonatomic, strong) NSNumber *afternoon;

/**
 The evening flag
 */
@property (nonatomic, strong) NSNumber *evening;

/**
 The full day flag
 */
@property (nonatomic, strong) NSNumber *fullday;

/**
 The price
 */
@property (nonatomic, strong) NSNumber *price;


@end
