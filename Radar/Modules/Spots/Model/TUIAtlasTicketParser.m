//
//  TUIAtlasTicketParser.m
//  Radar
//
//  Created by Diego Lafuente on 21/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIAtlasTicketParser.h"
// Models
#import "TUIAtlasTicket.h"

@implementation TUIAtlasTicketParser

#pragma mark - Parsing

+ (TUIAtlasTicket *)objectFromResponse:(id)response
{
    TUIAtlasTicket *atlasTicket = nil;
    
    if([TUIAtlasTicketParser responseIsValid:response])
    {
        atlasTicket = [[TUIAtlasTicket alloc] init];
        
        id name = [response objectForKey:@"name"];
        if([name isKindOfClass:[NSString class]])
        {
            atlasTicket.name = name;
        }
        
        id description = [response objectForKey:@"description"];
        if([description isKindOfClass:[NSString class]])
        {
            atlasTicket.descriptionBody = description;
        }
        
        id code = [response objectForKey:@"code"];
        if([code isKindOfClass:[NSString class]])
        {
            atlasTicket._id = code;
        }
        
        id imageUrl = [response objectForKey:@"imageUrl"];
        if([imageUrl isKindOfClass:[NSString class]])
        {
            atlasTicket.imageURLs = [[NSOrderedSet alloc] initWithArray:@[imageUrl]];
        }
        
        id latitude = [response objectForKey:@"latitude"];
        id longitude = [response objectForKey:@"longitude"];
        if([latitude isKindOfClass:[NSNumber class]] &&
           [longitude isKindOfClass:[NSNumber class]])
        {
            atlasTicket.location = [[CLLocation alloc] initWithLatitude:[latitude doubleValue] longitude:[longitude doubleValue]];
        }
        
        id indoor = [response objectForKey:@"indoor"];
        if([indoor isKindOfClass:[NSNumber class]])
        {
            atlasTicket.indoor = indoor;
        }
        
        id morning = [response objectForKey:@"morning"];
        if([morning isKindOfClass:[NSNumber class]])
        {
            atlasTicket.morning = morning;
        }
        
        id afternoon = [response objectForKey:@"afternoon"];
        if([afternoon isKindOfClass:[NSNumber class]])
        {
            atlasTicket.afternoon = afternoon;
        }
        
        id evening = [response objectForKey:@"evening"];
        if([evening isKindOfClass:[NSNumber class]])
        {
            atlasTicket.evening = evening;
        }
        
        id fullday = [response objectForKey:@"fullday"];
        if([fullday isKindOfClass:[NSNumber class]])
        {
            atlasTicket.fullday = fullday;
        }
    }
    
    return atlasTicket;
}


#pragma mark - Validation

+ (BOOL)responseIsValid:(id)response
{
    BOOL isValid = NO;
    
    if([response isKindOfClass:[NSDictionary class]] &&
       [response objectForKey:@"name"] &&
       [response objectForKey:@"description"] &&
       [response objectForKey:@"code"] &&
       [response objectForKey:@"imageUrl"] &&
       [response objectForKey:@"longitude"] &&
       [response objectForKey:@"latitude"])
    {
        isValid = YES;
    }
    
    return isValid;
}

@end
