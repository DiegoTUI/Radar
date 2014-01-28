//
//  TUIAtlasTicket.m
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIAtlasTicket.h"
// Models
#import "TUITimeManager.h"

@implementation TUIAtlasTicket


#pragma mark - Filters -

- (BOOL)compliesWithWeatherFilter:(NSString *)weatherFilter
                       timeFilter:(NSString *)timeFilter
{
    // Get time
    NSDate *currentTime = [TUITimeManager currentTime];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:currentTime];
    BOOL isAfternoon = (components.hour < TIME_AFTERNOON);
    BOOL isEvening = (components.hour < TIME_EVENING);
    // Apply filters
    if (([weatherFilter isEqualToString:WEATHER_CLOUDY] && ([_indoor boolValue] == NO)) ||
        ([timeFilter isEqualToString:TIME_TODAY] && ((isAfternoon && [_afternoon boolValue] == NO && [_evening boolValue] == NO) ||
                                                     (isEvening && [_evening boolValue] == NO) ||
                                                     (!isEvening))))
    {
        return NO;
    }
        
    return YES;
}

@end
