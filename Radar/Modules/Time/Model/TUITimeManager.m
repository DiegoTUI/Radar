//
//  TUITimeManager.m
//  Radar
//
//  Created by Diego Lafuente on 27/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUITimeManager.h"
// Models
#import "TUISettings.h"

@implementation TUITimeManager

+ (NSDate *)currentTime
{
    NSDate *currentTime = [NSDate date];
    TUISettings *currentSettings = [TUISettings currentSettings];
    
    if (![currentSettings.autotime boolValue])
    {
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        components.hour = [[currentSettings.time substringToIndex:TWO_INT] intValue];
        components.minute = [[currentSettings.time substringFromIndex:TWO_INT] intValue];
        
        currentTime = [[NSCalendar currentCalendar] dateFromComponents:components];
    }
    
    return currentTime;
}

@end
