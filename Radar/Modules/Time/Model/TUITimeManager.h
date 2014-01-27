//
//  TUITimeManager.h
//  Radar
//
//  Created by Diego Lafuente on 27/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"

/**
 TUIWeatherManager is used to manage the time
 */
@interface TUITimeManager : TUIBaseModel

/**
 @methodName currentTime
 @abstract Returns the current time
 @discussion This method returns the current time (hour and minute) in an NSDate
 
 @return A NSDate with the current time
 */
+ (NSDate *)currentTime;

@end
