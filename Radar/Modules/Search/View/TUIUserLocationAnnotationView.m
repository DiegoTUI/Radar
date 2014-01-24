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
    UIImageView     *_pulsatingDot;
    UIImageView     *_rotatingCircle;
    BOOL            _shouldStopAnimating;
}
@end

#define DEFAULT_ANIMATION_DURATION 1.5f
#define DEFAULT_ANIMATION_DELAY 2.0f
#define REDUCED_ALPHA 0.75f
#define REDUCED_SIZE_RATIO 0.7f

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
    UIImage *pinImage = [UIImage imageNamed:@"iconmap-me.png"];
    _rotatingCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ux-radar-rotation.png"]];
    UIImageView *pinImageView = [[UIImageView alloc] initWithImage:pinImage];
    _rotatingCircle.center = pinImageView.center;
    self.bounds = CGRectMake(ZERO_FLOAT, ZERO_FLOAT, pinImage.size.width, pinImage.size.height);
    [self addSubview:_rotatingCircle];
    [self addSubview:pinImageView];
    
    [self rotate];
}


#pragma mark - Animation -

- (void)stopAnimating
{
    _shouldStopAnimating = YES;
}

- (void)pulsate
{
}

- (void)goBack
{
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
         
         strongSelf->_rotatingCircle.transform = CGAffineTransformMakeRotation(currentAngle + M_PI/TWO_INT);
         
     }
                     completion:^(BOOL finished)
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         currentAngle += M_PI/TWO_INT;
         [strongSelf rotate];
     }];
}


@end
