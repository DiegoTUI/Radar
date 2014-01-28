//
//  NSURL+TUIURL.h
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//


/**
 A convenience category on NSURL to provice application wide URLs
 */
@interface NSURL (TUIURL)

/**
 @methodName APIURL
 @abstract The API endpoint URL
 @discussion This method will return the API's endpount URL as an NSURL
 
 @return An NSURL instance of the API endpoint
 */
+ (NSURL *)APIURL;

/**
 @methodName spotListURL:longitude:radius:
 @abstract Returns an NSURL API endpoint for a spot list request
 @discussion This method will return an NSURL API endpoint for a spot list request
 
 @param latitude The latitude of the request
 @param longitude The longitude of the request
 @param radius The radius of the request
 
 @return The NSURL endpoint
 */
+ (NSURL *)spotListURL:(CGFloat)latitude
             longitude:(CGFloat)longitude
                radius:(NSInteger)radius;

@end
