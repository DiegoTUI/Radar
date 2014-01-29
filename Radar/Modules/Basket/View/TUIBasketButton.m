//
//  TUIBasketButton.m
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasketButton.h"
// Extensions
#import "TUIBaseButton_Private.h"

#define DEFAULT_ANIMATION_DURATION  0.3f

static const CGFloat kBasketIconWidth = 23.0f;
static const CGFloat kBasketIconHeight = 19.0f;
static const CGFloat kCounterLabelRadius = 7.0f;
static const CGFloat kLabelOffsetX = 0.5f;
static const CGFloat kLabelOffsetY = -1.0f;

@interface TUIBasketButton()
{
    /**
     The counter label
     */
    UIView *_redCircleView;
    /**
     The counter label
     */
    UILabel *_counterLabel;
}
@end

@implementation TUIBasketButton


#pragma mark - Init -

- (TUIBasketButton *)initAsBarButton
{
    self = [super initWithFrame:CGRectMake(ZERO_FLOAT, ZERO_FLOAT, kBasketIconWidth + kCounterLabelRadius, kBasketIconHeight + kCounterLabelRadius)];
    
    if (self)
    {
    }
    
    return self;
}


#pragma mark - Setup -

- (void)setup
{
    [super setup];
    
    [self setupBasketIconImage];
    [self setupRedCircleView];
    [self setupCounterLabel];
}

- (void)setupBasketIconImage
{
    UIImage *basketIcon = [UIImage imageNamed:@"iconnav-basket.png"];
    [self setImage:basketIcon forState:UIControlStateNormal];
}

- (void)setupRedCircleView
{
    _redCircleView = [[UIView alloc] initWithFrame:CGRectMake(kBasketIconWidth - kCounterLabelRadius, ZERO_FLOAT, TWO_FLOAT * kCounterLabelRadius, TWO_FLOAT * kCounterLabelRadius)];
    _redCircleView.backgroundColor = [UIColor redColor];
    // make it circular
    CALayer *redCircleViewLayer = _redCircleView.layer;
    [redCircleViewLayer setCornerRadius:kCounterLabelRadius];
    [redCircleViewLayer setMasksToBounds:YES];
    // hide it
    _redCircleView.transform = CGAffineTransformMakeScale(ZERO_FLOAT, ZERO_FLOAT);
    
    [self addSubview:_redCircleView];
}

- (void)setupCounterLabel
{
    _counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelOffsetX, kLabelOffsetY, TWO_FLOAT * kCounterLabelRadius, TWO_FLOAT * kCounterLabelRadius)];
    [_counterLabel setFont:[UIFont fontWithName:BOLD_FONT size:BASKET_COUNTER_SIZE]];
    [_counterLabel setText:@"0"];
    _counterLabel.textAlignment = NSTextAlignmentCenter;
    [_counterLabel setTextColor:[UIColor whiteColor]];
    _counterLabel.backgroundColor = [UIColor clearColor];
    
    [_redCircleView addSubview:_counterLabel];
}


#pragma mark - Show/Hide counter -

- (void)showCounterAnimatedWithText:(NSString *)text
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_DURATION
                          delay:ZERO_FLOAT
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         strongSelf->_redCircleView.transform = CGAffineTransformIdentity;
     } completion:nil];
}

- (void)hideCounterAnimated
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_DURATION
                          delay:ZERO_FLOAT
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         typeof(self) strongSelf = weakSelf;
         if ( !strongSelf ) { return ;}
         
         strongSelf->_redCircleView.transform = CGAffineTransformMakeScale(ZERO_FLOAT, ZERO_FLOAT);
     } completion:nil];
}

@end
