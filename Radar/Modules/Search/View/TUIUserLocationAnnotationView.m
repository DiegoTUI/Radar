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
}


@end
