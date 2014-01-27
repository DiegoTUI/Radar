//
//  TUIFilters.m
//  Radar
//
//  Created by jmartin on 24/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIFilters.h"

@implementation TUIFilters


#pragma mark - Init -


+ (TUIFilters *)defaultSettings
{
    TUIFilters *result = [[TUIFilters alloc] init];
    
    result.weatherFilterIndex = ZERO_INT;
    result.timeFilterIndex = ZERO_INT;
    result.distanceFilterIndex = ZERO_INT;
    
    result.weatherFilterLabel = NSLocalizedString(@"FILTERS_WEATHER_INDOOR", nil);
    result.distanceFilterLabel = NSLocalizedString(@"FILTERS_DISTANCE_300M", nil);
    result.timeFilterLabel = NSLocalizedString(@"FILTERS_TIME_TODAY", nil);
    
    result.weatherFilterIconImage = @"filter-indoor";
    result.distanceFilterIconImage = @"filter-300m";
    result.timeFilterIconImage = @"filter-now";
    
    result.lastPageViewControllerChanged = EMPTY_STRING;
    
    return result;
}


#pragma mark - Description

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%p> weatherFilterIndex:%lu, weatherFilterLabel: %@, weatherFilterIconImage: %@ ----  distanceFilterIndex:%lu, distanceFilterLabell: %@, distanceFilterIconImage: %@ ----  timeFilterIndex:%lu, timeFilterLabe: %@, timeFilterIconImage: %@, ---> last: %@",
            self,
            (unsigned long)self.weatherFilterIndex,
            self.weatherFilterLabel,
            self.weatherFilterIconImage,
            (unsigned long)self.distanceFilterIndex,
            self.distanceFilterLabel,
            self.distanceFilterIconImage,
            (unsigned long)self.timeFilterIndex,
            self.timeFilterLabel,
            self.timeFilterIconImage,
            self.lastPageViewControllerChanged];
}

@end
