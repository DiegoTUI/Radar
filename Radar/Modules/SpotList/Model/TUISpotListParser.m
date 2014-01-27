//
//  TUISpotListParser.m
//  Radar
//
//  Created by Diego Lafuente on 21/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotListParser.h"
// Models
#import "TUISpotList.h"
#import "TUIAtlasTicketParser.h"
#import "TUIFoursquareVenueParser.h"

@implementation TUISpotListParser

#pragma mark - Parsing

+ (TUISpotList *)objectFromResponse:(id)response
{
    TUISpotList *spotList = nil;
    
    if([TUISpotListParser responseIsValid:response])
    {
        spotList = [[TUISpotList alloc] init];
        
        NSMutableOrderedSet *spots = [NSMutableOrderedSet orderedSet];
        
        for (NSDictionary *element in response)
        {
            if ([element[@"type"] isEqualToString:@"atlas"])
            {
                [spots addObject:[TUIAtlasTicketParser objectFromResponse:element]];
            }
            else if ([element[@"type"] isEqualToString:@"foursquare"])
            {
                [spots addObject:[TUIFoursquareVenueParser objectFromResponse:element]];
            }
        }
        
        spotList.spots = spots;
    }
    
    return spotList;
}


#pragma mark - Validation

+ (BOOL)responseIsValid:(id)response
{
    BOOL isValid = NO;
    
    if([response isKindOfClass:[NSArray class]])
    {
        isValid = YES;
        
        for (NSDictionary *element in response)
        {
            if (![element objectForKey:@"type"])
            {
                return NO;
            }
            if (![element[@"type"] isEqualToString:@"atlas"] &&
                ![element[@"type"] isEqualToString:@"foursquare"])
            {
                return NO;
            }
            if ([element[@"type"] isEqualToString:@"atlas"] &&
                ![TUIAtlasTicketParser responseIsValid:element])
            {
                return NO;
            }
            if ([element[@"type"] isEqualToString:@"foursquare"] &&
                     ![TUIFoursquareVenueParser responseIsValid:element])
            {
                return NO;
            }
            
        }
    }
    
    return isValid;
}

@end
