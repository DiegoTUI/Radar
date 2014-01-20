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

+ (TUISpotList *)testSpotList
{
    TUISpotList *testList = [[TUISpotList alloc] init];
    
    NSMutableOrderedSet *spots = [NSMutableOrderedSet orderedSet];
    
    for (int i=0; i<8; i++)
    {
        if (i % 2)
        {
            [spots addObject:[[TUIAtlasTicket alloc] init]];
        }
        else
        {
            [spots addObject:[[TUIFoursquareVenue alloc] init]];
        }
    }
    
    testList.spots = spots;
    
    return testList;
}

@end
