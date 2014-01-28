//
//  TUIFilters.m
//  Radar
//
//  Created by jmartin on 24/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIFilters.h"
// Models
#import "TUIWeatherManager.h"
#import "TUITimeManager.h"

#define INDOOR_ICON     @"filter-indoor"
#define OUTDOOR_ICON    @"filter-outdoor"
#define NOW_ICON        @"filter-now"
#define TOMORROW_ICON   @"filter-tomorrow"
#define _300M_ICON      @"filter-300m"


@implementation TUIFilters


#pragma mark - Init -

+ (TUIFilters *)currentFilters
{
    TUIFilters *result = [[TUIFilters alloc] init];
    
    // Weather
    if ([[TUIWeatherManager currentWeather] isEqualToString:WEATHER_SUNNY])
    {
        result.weatherFilterIndex = ONE_INT;
        result.weatherFilterLabel = NSLocalizedString(@"FILTERS_WEATHER_SUNNY", nil);
        result.weatherFilterIconImage = OUTDOOR_ICON;
    }
    else
    {
        result.weatherFilterIndex = ZERO_INT;
        result.weatherFilterLabel = NSLocalizedString(@"FILTERS_WEATHER_CLOUDY", nil);
        result.weatherFilterIconImage = INDOOR_ICON;
    }
    
    // Time
    NSDate *currentTime = [TUITimeManager currentTime];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:currentTime];
    if (components.hour >= TIME_THRESHOLD)
    {
        result.timeFilterIndex = ONE_INT;
        result.timeFilterLabel = NSLocalizedString(@"FILTERS_TIME_TOMORROW", nil);
        result.timeFilterIconImage = TOMORROW_ICON;
    }
    else
    {
        result.timeFilterIndex = ZERO_INT;
        result.timeFilterLabel = NSLocalizedString(@"FILTERS_TIME_TODAY", nil);
        result.timeFilterIconImage = NOW_ICON;
    }
    
    // Distance
    result.distanceFilterIndex = ZERO_INT;
    result.distanceFilterLabel = NSLocalizedString(@"FILTERS_DISTANCE_300M", nil);
    result.distanceFilterIconImage = @"filter-300m";
    
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
