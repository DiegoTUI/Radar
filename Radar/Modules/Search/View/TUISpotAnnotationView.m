//
//  TUISpotAnnotationView.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 26/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotAnnotationView.h"
// Models
#import "TUIAtlasTicket.h"
#import "TUIFoursquareVenue.h"

@implementation TUISpotAnnotationView


#pragma mark - Init

- (id)initWithAnnotation:(id<MKAnnotation>)annotation
         reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
    }
    return self;
}


#pragma mark - Setup

- (void)setup
{
    [self setupIcon];
}

- (void)setupIcon
{
    UIImage *iconImage = [self.annotation isKindOfClass:[TUIAtlasTicket class]] ? [UIImage imageNamed:@"iconmap-tui-culture.png"] :
                                                                                    [UIImage imageNamed:@"iconmap-fsq-restaurant.png"];
    // set bounds
    self.bounds = CGRectMake(ZERO_FLOAT, ZERO_FLOAT, iconImage.size.width, iconImage.size.height);
    // build image view
    UIImageView *iconImageView = [[UIImageView alloc] initWithImage:iconImage];
    // add subview
    [self addSubview:iconImageView];
}

@end
