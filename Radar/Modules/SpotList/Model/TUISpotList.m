//
//  TUISpotList.m
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotList.h"
// Models
#import "TUIAtlasTicket.h"
#import "TUIFoursquareVenue.h"

@implementation TUISpotList


#pragma mark - Init -

- (TUISpotList *)init
{
    self = [super init];
    if (self)
    {
        self.spots = [NSOrderedSet orderedSet];
    }
    return self;
}


#pragma mark - Shuffle -

- (void)shuffle
{
    NSMutableOrderedSet *shuffledSpots = [_spots mutableCopy];
    NSUInteger firstFourSquareIndex = ZERO_INT;
    TUISpot *firstFourSquareVenue = nil;
    // find the first four square
    while (firstFourSquareVenue == nil &&
           firstFourSquareIndex < shuffledSpots.count)
    {
        TUISpot *spot = shuffledSpots[firstFourSquareIndex];
        if ([spot isKindOfClass:[TUIFoursquareVenue class]])
        {
            firstFourSquareVenue = spot;
        }
        firstFourSquareIndex++;
    }
    // shuffle
    NSUInteger numberOfAtlasTickets = firstFourSquareIndex;
    NSUInteger numberOfFourSquareVenues = shuffledSpots.count - firstFourSquareIndex;
    NSUInteger timesToShuffle = numberOfAtlasTickets < numberOfFourSquareVenues ? numberOfAtlasTickets : numberOfFourSquareVenues;
    NSUInteger shuffleIndex = ZERO_INT;
    
    for (int i=0; i<timesToShuffle; i++)
    {
        //get the element pointed by firstFourSquareIndex and move it right below shuffleIndex
        TUIFoursquareVenue *objectToShuffle = shuffledSpots[firstFourSquareIndex];
        [shuffledSpots removeObjectAtIndex:firstFourSquareIndex];
        [shuffledSpots insertObject:objectToShuffle atIndex:(shuffleIndex + ONE_INT)];
        shuffleIndex += TWO_INT;
    }
    // update spot list
    _spots = shuffledSpots;
}



@end
