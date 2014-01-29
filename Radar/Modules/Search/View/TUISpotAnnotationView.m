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

#define RANDOM_BASE                     500
#define RANDOM_BASE_FLOAT               500.0f
#define ANIMATION_DURATION              0.1f
#define ANIMATION_ROTATE_DEGREES        0.1f
#define ANIMATION_DEVIATION             10.0f
#define ANIMATION_ANCHOR_POINT_X        0.5f
#define ANIMATION_ANCHOR_POINT_Y        0.5f

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

@interface TUISpotAnnotationView()
{
    UIImageView     *_jigglingIcon;
}
@end


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
    _jigglingIcon = [[UIImageView alloc] initWithImage:iconImage];
    // add subview
    [self addSubview:_jigglingIcon];
}


#pragma mark - Animation -

- (void)startJiggling
{
    NSInteger randomInt = arc4random_uniform(RANDOM_BASE);
    float r = (randomInt/RANDOM_BASE_FLOAT) + ANIMATION_DEVIATION;
    
    CGAffineTransform leftWobble = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS( (ANIMATION_ROTATE_DEGREES * + ANIMATION_DEVIATION) - r ));
    CGAffineTransform rightWobble = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS( ANIMATION_ROTATE_DEGREES + r ));
    
    self.transform = leftWobble;  // starting point
    
    [[self layer] setAnchorPoint:CGPointMake(ANIMATION_ANCHOR_POINT_X, ANIMATION_ANCHOR_POINT_Y)];
    
    [UIView animateWithDuration:ANIMATION_DURATION
                          delay:ZERO_FLOAT
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         [UIView setAnimationRepeatCount:NSNotFound];
                         _jigglingIcon.transform = rightWobble; }
                     completion:nil];
}

- (void)stopJiggling {
    [_jigglingIcon.layer removeAllAnimations];
    _jigglingIcon.transform = CGAffineTransformIdentity;
}

@end
