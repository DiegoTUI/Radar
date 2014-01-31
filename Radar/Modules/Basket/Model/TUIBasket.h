//
//  TUIBasket.h
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"
//Forward declarations
@class TUIAtlasTicket;

/**
 TUIBasket represents a users current booking basket.
 */
@interface TUIBasket : TUIBaseModel

/**
 @methodName addAtlasTicket:
 @abstract Adds an Atlas ticket to the basket
 @discussion Adds an Atlas ticket to the basket
 
 @param atlasTicket The ticket to add
 */
- (void)addAtlasTicket:(TUIAtlasTicket *)atlasTicket;

/**
 @methodName removeAtlasTicket:
 @abstract Removes an Atlas ticket to the basket
 @discussion Removes an Atlas ticket to the basket
 
 @param atlasTicket The ticket to remove
 */
- (void)removeAtlasTicket:(TUIAtlasTicket *)atlasTicket;

/**
 @methodName ticketCount
 @abstract Returns the number of tickets in the basket
 @discussion This method will return the number of
 tickets currently in the basket
 
 @return The total number of tickets
 */
- (NSInteger)ticketCount;

/**
 @methodName totalPrice
 @abstract Returns the total price of the spots in the basket
 @discussion This method will return the total price of the spots in the basket
 
 @return The total price of the spots in the basket
 */
- (NSNumber *)totalPrice;

@end
