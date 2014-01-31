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
@property (nonatomic, strong, readwrite) NSMutableOrderedSet *spots;

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

- (void)removeAtlasTicket:(TUIAtlasTicket *)atlasTicket
{
    [_spots removeObject:atlasTicket];
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

#pragma mark - Price -

- (NSNumber *)totalPrice
{
    NSNumber *totalPrice = [NSNumber numberWithDouble:ZERO_FLOAT];
    
    for (TUIAtlasTicket *atlasTicket in _spots)
    {
        totalPrice = [NSNumber numberWithDouble:([totalPrice doubleValue] + [atlasTicket.price doubleValue])];
    }
    
    return totalPrice;
}

#pragma mark - Description

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%p> Count:%d, Spots: %@", self , [self ticketCount], self.spots];
}

@end
