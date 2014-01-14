//
//  TUIUserLocation.m
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUILocation.h"

@implementation TUILocation


#pragma mark - Default user location -

+ (TUILocation *)defaultUserLocation
{
    TUILocation *result = [[TUILocation alloc]init];
    result.latitude = [NSNumber numberWithDouble: DEFAULT_LATITUDE];
    result.longitude = [NSNumber numberWithDouble: DEFAULT_LONGITUDE];
    return result;
}

#pragma mark - Serializing -

- (NSDictionary *)dictionary
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    if (_latitude)
    {
        [result setValue:_latitude forKey:@"latitude"];
    }
    if (_longitude)
    {
        [result setValue:_longitude forKey:@"longitude"];
    }
    
    return result;
}


#pragma mark - Parsing -

+ (TUIBaseModel<TUISerializable> *)objectFromDictionary:(NSDictionary *)dictionary
{
    NSNumber *latitude = [dictionary objectForKey:@"latitude"];
    NSNumber *longitude = [dictionary objectForKey:@"longitude"];
    
    TUILocation *result = [[TUILocation alloc] init];
    if (latitude)
    {
        result.latitude = latitude;
    }
    if (longitude)
    {
        result.longitude = longitude;
    }
    
    return result;
}


#pragma mark - Description

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%p> Latitude: %@, Longitude: %@",
            self,
            self.latitude,
            self.longitude];
}

@end
