//
//  TUIBaseMapAnnotation.m
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseMapAnnotation.h"


@implementation TUIBaseMapAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if(self)
    {
        _coordinate = coordinate;
    }
    return self;
}

- (void)updateCoordinate:(CLLocationCoordinate2D)coordinate
{
	_coordinate = coordinate;
}

@end
