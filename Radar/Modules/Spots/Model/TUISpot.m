//
//  TUISpot.m
//  Radar
//
//  Created by Diego Lafuente on 14/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpot.h"

@implementation TUISpot

#pragma mark - Description

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%p> Id:%@, Name: %@", self , self._id, self.name];
}

@end
