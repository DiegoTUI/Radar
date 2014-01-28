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

#define DEFAULT_ANIMATION_DURATION 0.05f
#define DEFAULT_ANIMATION_DELAY 0.0f
#define REDUCED_ALPHA 0.80f
#define AUGMENTED_SIZE_RATIO 1.1f

@interface TUISpotAnnotationView()
{
    UIImageView     *_pulsatingIcon;
    BOOL            _shouldStopAnimating;
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
    _pulsatingIcon = [[UIImageView alloc] initWithImage:iconImage];
    // add subview
    [self addSubview:_pulsatingIcon];
}


#pragma mark - Animation -

- (void)startPulsating
{
    _shouldStopAnimating = NO;
    [self pulsate];
}

- (void)stopPulsating
{
    _shouldStopAnimating = YES;
}


- (void)pulsate
{
    if ( _shouldStopAnimating )
    {
        return;
    }
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_DURATION
                          delay:DEFAULT_ANIMATION_DELAY
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         strongSelf->_pulsatingIcon.transform = CGAffineTransformMakeScale(AUGMENTED_SIZE_RATIO, AUGMENTED_SIZE_RATIO);
         strongSelf->_pulsatingIcon.alpha = REDUCED_ALPHA;
     }
                     completion:^(BOOL finished)
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         [strongSelf goBack];
     }];
}

- (void)goBack
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_DURATION
                          delay:ZERO_FLOAT
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         strongSelf->_pulsatingIcon.transform = CGAffineTransformIdentity;
         strongSelf->_pulsatingIcon.alpha = ONE_FLOAT;
     }
                     completion:^(BOOL finished)
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         [strongSelf pulsate];
     }];
}

#define degreesToRadians(x) (M_PI * (x) / 180.0)
#define kAnimationRotateDeg 1.0

- (void)startJiggling
{
    NSInteger randomInt = arc4random_uniform(500);
    float r = (randomInt/500.0)+10;
    
    CGAffineTransform leftWobble = CGAffineTransformMakeRotation(degreesToRadians( (kAnimationRotateDeg * +10.0) - r ));
    CGAffineTransform rightWobble = CGAffineTransformMakeRotation(degreesToRadians( kAnimationRotateDeg + r ));
    
    self.transform = leftWobble;  // starting point
    
    [[self layer] setAnchorPoint:CGPointMake(0.5, 0.5)];
    
    [UIView animateWithDuration:0.1
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         [UIView setAnimationRepeatCount:NSNotFound];
                         _pulsatingIcon.transform = rightWobble; }
                     completion:nil];
}

- (void)stopJiggling {
    [_pulsatingIcon.layer removeAllAnimations];
    _pulsatingIcon.transform = CGAffineTransformIdentity;
}

@end
