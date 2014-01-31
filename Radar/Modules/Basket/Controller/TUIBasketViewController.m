//
//  TUIBasketViewController.m
//  Radar
//
//  Created by Diego Lafuente on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasketViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"

@interface TUIBasketViewController ()

@end

const CGFloat kTitleViewWidth = 250.0f;
const CGFloat kTitleViewHeight = 40.0f;
const CGFloat kTitleLabelWidth = 100.0f;
const CGFloat kTitleLabelHeight = 20.0f;

@implementation TUIBasketViewController


#pragma mark - Initilialize data -

- (void)initData
{
    [super initData];
    
}


#pragma mark - Initilialize user interface -

- (void)initUserInterface
{
    [super initUserInterface];
    
    [self initNavigationTitle];
}

- (void)initNavigationTitle
{
    UIView * customTitleView = [[UIView alloc] initWithFrame:CGRectMake(ZERO_FLOAT, ZERO_FLOAT, kTitleViewWidth, kTitleViewHeight)];
    
    UILabel * customLabel = [[UILabel alloc] initWithFrame:CGRectMake(ZERO_FLOAT, ZERO_FLOAT, kTitleLabelWidth, kTitleLabelHeight)];
    [customLabel setBackgroundColor:[UIColor clearColor]];
    [customLabel setTextColor:[UIColor tuiLightGreenColor]];
    [customLabel setFont:[UIFont fontWithName:REGULAR_FONT size:TITLE_SECTION_FONT_SIZE]];
    [customLabel setTextAlignment:NSTextAlignmentCenter];
    [customLabel setText:NSLocalizedString(@"BASKET_TITLE", nil)];
    [customLabel sizeToFit];
    customLabel.x = (SCREEN_WIDTH - SLIDING_VIEW_CONTROLLER_LEFT_PEEK_AMOUNT - customLabel.width) / TWO_FLOAT;
    [customTitleView addSubview:customLabel];
    
    [self.navigationItem setTitleView:customTitleView];
    
}

@end
