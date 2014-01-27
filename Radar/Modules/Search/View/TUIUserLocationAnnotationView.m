//
//  TUIUserLocationAnnotationView.m
//  Radar
//
//  Created by Diego Lafuente on 24/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIUserLocationAnnotationView.h"

@interface TUIUserLocationAnnotationView ()
{
    UIImageView     *_pulsatingCircle;
    UIImageView     *_pulsatingRing;
    UIImageView     *_pulsatingCircle2;
    UIImageView     *_pulsatingRing2;
    UIImageView     *_rotatingCircle;
    BOOL            _shouldStopAnimating;
}
@end

#define DEFAULT_ANIMATION_DURATION 1.5f
#define DEFAULT_ANIMATION_DELAY 2.0f
#define PULSATE2_ANIMATION_DELAY 2.2f
#define REDUCED_ALPHA 0.1f
#define REDUCED_SIZE_RATIO 0.15f
#define AUGMENTED_SIZE_RATIO 1.5f
#define REDUCED_SIZE_RATIO_ROTATING_CIRCLE 0.5f

@implementation TUIUserLocationAnnotationView

#pragma mark - Init -

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews
{
    // load images and create imageviews
    UIImage *pinImage = [UIImage imageNamed:@"iconmap-me.png"];
    _rotatingCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ux-radar-rotation.png"]];
    _pulsatingCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ux-radar-scale.png"]];
    _pulsatingRing = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ux-radar-ring.png"]];
    _pulsatingCircle2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ux-radar-scale.png"]];
    _pulsatingRing2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ux-radar-ring.png"]];
    UIImageView *pinImageView = [[UIImageView alloc] initWithImage:pinImage];
    // center images
    _rotatingCircle.center = pinImageView.center;
    _pulsatingCircle.center = pinImageView.center;
    _pulsatingRing.center = pinImageView.center;
    _pulsatingCircle2.center = pinImageView.center;
    _pulsatingRing2.center = pinImageView.center;
    // set bounds
    self.bounds = CGRectMake(ZERO_FLOAT, ZERO_FLOAT, pinImage.size.width, pinImage.size.height);
    // scale pulsatingCircle, rotatingCircle and pulsatingRing
    _pulsatingCircle.transform = CGAffineTransformMakeScale(REDUCED_SIZE_RATIO, REDUCED_SIZE_RATIO);
    _pulsatingRing.transform = CGAffineTransformMakeScale(REDUCED_SIZE_RATIO, REDUCED_SIZE_RATIO);
    _pulsatingCircle2.transform = CGAffineTransformMakeScale(REDUCED_SIZE_RATIO, REDUCED_SIZE_RATIO);
    _pulsatingRing2.transform = CGAffineTransformMakeScale(REDUCED_SIZE_RATIO, REDUCED_SIZE_RATIO);
    // add subviews
    [self addSubview:_rotatingCircle];
    [self addSubview:_pulsatingCircle];
    [self addSubview:_pulsatingRing];
    [self addSubview:_pulsatingCircle2];
    [self addSubview:_pulsatingRing2];
    [self addSubview:pinImageView];
    // start animations
    [self rotate];
    [self pulsate];
    [self pulsate2WithDelay:PULSATE2_ANIMATION_DELAY];
}


#pragma mark - Animation -

- (void)stopAnimating
{
    _shouldStopAnimating = YES;
}

- (void)pulsate
{
    if (_shouldStopAnimating)
    {
        return;
    }
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_DURATION/TWO_INT
                          delay:DEFAULT_ANIMATION_DELAY
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         strongSelf->_pulsatingCircle.transform = CGAffineTransformMakeScale(AUGMENTED_SIZE_RATIO, AUGMENTED_SIZE_RATIO);
         strongSelf->_pulsatingCircle.alpha = REDUCED_ALPHA;
         strongSelf->_pulsatingRing.transform = CGAffineTransformMakeScale(AUGMENTED_SIZE_RATIO, AUGMENTED_SIZE_RATIO);
         strongSelf->_pulsatingRing.alpha = REDUCED_ALPHA;
     }
                     completion:^(BOOL finished)
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         // return to normal
         strongSelf->_pulsatingCircle.transform = CGAffineTransformMakeScale(REDUCED_SIZE_RATIO, REDUCED_SIZE_RATIO);
         strongSelf->_pulsatingCircle.alpha = ONE_FLOAT;
         strongSelf->_pulsatingRing.transform = CGAffineTransformMakeScale(REDUCED_SIZE_RATIO, REDUCED_SIZE_RATIO);
         strongSelf->_pulsatingRing.alpha = ONE_FLOAT;
         // pulsate again
         [strongSelf pulsate];
     }];
}

- (void)pulsate2WithDelay:(CGFloat)delay
{
    if (_shouldStopAnimating)
    {
        return;
    }
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_DURATION/TWO_INT
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         strongSelf->_pulsatingCircle2.transform = CGAffineTransformMakeScale(AUGMENTED_SIZE_RATIO, AUGMENTED_SIZE_RATIO);
         strongSelf->_pulsatingCircle2.alpha = REDUCED_ALPHA;
         strongSelf->_pulsatingRing2.transform = CGAffineTransformMakeScale(AUGMENTED_SIZE_RATIO, AUGMENTED_SIZE_RATIO);
         strongSelf->_pulsatingRing2.alpha = REDUCED_ALPHA;
     }
                     completion:^(BOOL finished)
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         // return to normal
         strongSelf->_pulsatingCircle2.transform = CGAffineTransformMakeScale(REDUCED_SIZE_RATIO, REDUCED_SIZE_RATIO);
         strongSelf->_pulsatingCircle2.alpha = ONE_FLOAT;
         strongSelf->_pulsatingRing2.transform = CGAffineTransformMakeScale(REDUCED_SIZE_RATIO, REDUCED_SIZE_RATIO);
         strongSelf->_pulsatingRing2.alpha = ONE_FLOAT;
         // pulsate again
         [strongSelf pulsate2WithDelay:DEFAULT_ANIMATION_DELAY];
     }];
}

- (void)rotate
{
    if (_shouldStopAnimating)
    {
        return;
    }
    static CGFloat currentAngle = ZERO_FLOAT;
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_DURATION/TWO_INT
                          delay:ZERO_FLOAT
                        options:UIViewAnimationOptionCurveLinear
                     animations:^
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         strongSelf->_rotatingCircle.transform = CGAffineTransformMakeRotation(currentAngle - M_PI/TWO_INT);
         
     }
                     completion:^(BOOL finished)
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         currentAngle -= M_PI/TWO_INT;
         [strongSelf rotate];
     }];
}


@end
