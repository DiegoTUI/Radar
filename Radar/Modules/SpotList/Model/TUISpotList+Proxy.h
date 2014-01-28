//
//  TUISpotList+Proxy.h
//  Radar
//
//  Created by Diego Lafuente on 21/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotList.h"
#import "TUIProxy.h"

@interface TUISpotList (Proxy) <TUIProxy>

/**
 @methodName spotsForLatitude:longitude:radius:completion:failure:
 @abstract Requests a list of spots with a specfic location and radius
 @discussion This method will send a request to the API endpoint requesting a 
 list of spots with a certain location and radius the TUISpotList object will be
 returned in the compleition block. If there is an error the failure block will
 be triggered with an NSError object.
 
 @param latitude The latitude of the request
 @param longitude The longitude of the request
 @param radius The radius of the request
 @param completion The compleition block containing the LRHotel object
 @param failure The failure block containg the NSError that occured
 */
+ (void)spotsForLatitude:(double)latitude
               longitude:(double)longitude
                  radius:(NSInteger)radius
              completion:(void(^)(TUISpotList *spotList))completion
                 failure:(void(^)(NSError *error))failure;

@end
