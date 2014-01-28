//
//  TUILocationManager.h
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"
// Models
#import "TUIUserLocation.h"
// Forward declarations
@protocol TUILocationManagerDelegate;

/**
 TUILocationManager is a singleton to perform the location actions
 */
@interface TUILocationManager : TUIBaseModel

/**
 The TUILocationManagerDelegate delegate
 */
@property (nonatomic, weak) id<TUILocationManagerDelegate> delegate;

/**
 @methodName sharedManager
 @abstract A singleton instance of the TUILocationManager
 @discussion This method will return a singleton class of the TUILocationManager which
 is in charge of making HTTP calls
 
 @return The singleton instance of TUILocationManager
 */
+ (TUILocationManager *)sharedManager;

/**
 @methodName startGettingUserLocation
 @abstract Triggers the location manager and starts fetching the user location
 @discussion This method will trigger the location manager and starts fetching the 
 user's location. If unavailable, it will try to retrieve the last stored user's
 location. If unavailable, it returns the default location. It calls userLocationReady:
 method of the delegate.
 */
- (void)startGettingUserLocation;

@end

@protocol TUILocationManagerDelegate <NSObject>

/**
 @methodName userLocationReady
 @abstract Method called when the TUILocationManager has found the user's location
 @discussion This method is called when the user's location is ready to be sent
 
 @param location The User's location
 */
- (void)userLocationReady:(TUIUserLocation *)location;

@end
