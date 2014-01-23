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

/**
 @methodName shuffle
 @abstract Shuffles the spotlist to maximize the "entropy" fo the list
 @discussion Normally the server will return all the ATLAS results first and all
 the Foursquare results after (AAAAFFFFFFF). This methos will shuffle the list 
 to make it look like (AFAFAFAFFFF).
 */
- (void)shuffle;

@end
