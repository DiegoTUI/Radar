//
//  TUIHotelMapAnnotationSpec.m
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUIBaseMapAnnotation.h"

SPEC_BEGIN(TUIHotelMapAnnotationSpec)

__block TUIBaseMapAnnotation *mapAnnotation;

beforeEach(^{
    mapAnnotation = [[TUIBaseMapAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(1, 1)];
    mapAnnotation.title = @"Title";
    mapAnnotation.subtitle = @"Subtitle";
});

describe(@"TUIHotelMapAnnotation", ^{
    it(@"should have a coordinate", ^{
        [[theValue(mapAnnotation.coordinate.latitude) should] equal:theValue(1)];
        [[theValue(mapAnnotation.coordinate.longitude) should] equal:theValue(1)];
    });
    
    it(@"should have a title", ^{
        [[mapAnnotation.title should] equal:@"Title"];
    });
    
    it(@"should have a subtitle", ^{
        [[mapAnnotation.subtitle should] equal:@"Subtitle"];
    });
});

SPEC_END