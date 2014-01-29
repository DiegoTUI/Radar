//
//  TUIBasket.m
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasket.h"
// Models
#import "TUIAtlasTicket.h"

@interface TUIBasket ()

/**
 The spots in the basket
 */
@property (nonatomic, strong) NSMutableOrderedSet *spots;

@end

@implementation TUIBasket


#pragma mark - Init -

- (id)init
{
    self = [super init];
    if (self)
    {
        _spots = [NSMutableOrderedSet orderedSet];
    }
    return self;
}


#pragma mark - Spots -

- (void)addAtlasTicket:(TUIAtlasTicket *)atlasTicket
{
    [_spots addObject:atlasTicket];
}

- (NSInteger)ticketCount
{
    return _spots.count;
}

- (TUIAtlasTicket *)ticketAtIndex:(NSInteger)index
{
    TUIAtlasTicket *ticket = nil;
    
    if (index < _spots.count)
    {
        ticket = _spots[index];
    }
    
    return ticket;
}

@end
