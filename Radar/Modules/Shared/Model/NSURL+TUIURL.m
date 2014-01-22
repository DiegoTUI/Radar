//
//  NSURL+TUIURL.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "NSURL+TUIURL.h"

@implementation NSURL (TUIURL)

#pragma mark - Generic -

+ (NSURL *)APIURL
{
    NSURL *APIURL = [NSURL URLWithString:API_URL];
    
    return APIURL;
}


#pragma mark - Spot list -

+ (NSURL *)spotListURL:(CGFloat)latitude
             longitude:(CGFloat)longitude
                radius:(NSInteger)radius
{
    NSString *path = [NSString stringWithFormat:@"ms-venues?ll=%f,%f&radius=%d", latitude, longitude, radius];
    return [NSURL URLWithString:path relativeToURL:[NSURL APIURL]];
}

@end
