//
//  TUIFoursquareVenueParser.m
//  Radar
//
//  Created by Diego Lafuente on 21/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIFoursquareVenueParser.h"
// Models
#import "TUIFoursquareVenue.h"

@implementation TUIFoursquareVenueParser


#pragma mark - Parsing

+ (TUIFoursquareVenue *)objectFromResponse:(id)response
{
    TUIFoursquareVenue *foursquareVenue = nil;
    
    if([TUIFoursquareVenueParser responseIsValid:response])
    {
        foursquareVenue = [[TUIFoursquareVenue alloc] init];
        
        id name = [response objectForKey:@"name"];
        if([name isKindOfClass:[NSString class]])
        {
            foursquareVenue.name = name;
        }
        
        id code = [response objectForKey:@"code"];
        if([code isKindOfClass:[NSString class]])
        {
            foursquareVenue._id = code;
        }
        
        id latitude = [response objectForKey:@"latitude"];
        id longitude = [response objectForKey:@"longitude"];
        if([latitude isKindOfClass:[NSNumber class]] &&
           [longitude isKindOfClass:[NSNumber class]])
        {
            CLLocationCoordinate2D coordinate;
            coordinate.latitude = [latitude doubleValue];
            coordinate.longitude = [longitude doubleValue];
            foursquareVenue.coordinate = coordinate;
        }
    }
    
    return foursquareVenue;
}


#pragma mark - Validation

+ (BOOL)responseIsValid:(id)response
{
    BOOL isValid = NO;
    
    if([response isKindOfClass:[NSDictionary class]] &&
       [response objectForKey:@"name"] &&
       [response objectForKey:@"code"] &&
       [response objectForKey:@"longitude"] &&
       [response objectForKey:@"latitude"])
    {
        isValid = YES;
    }
    
    return isValid;
}

@end
