//
//  TUITitleView.m
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUITitleView.h"
// Extensions
#import "TUIBaseView_Private.h"
// Views
#import "TUIBaseLabel.h"


static const CGFloat kTitleLabelFontSize                = 14.0f;
static const CGFloat kTitleLabelStandaloneFontSize      = 14.0f;
static const CGFloat kSubtitleLabelFontSize             = 11.0f;
static const CGFloat kFrameWidth                        = 225.0f;
static const CGFloat kFrameHeight                       = 44.0f;

#define TUI_TITLE_VIEW_ONE_LINE_TITLE_FRAME CGRectIntegral(CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, kFrameHeight))

#define TUI_TITLE_VIEW_TITLE_LABEL_FRAME_CENTER CGRectIntegral(CGRectMake(ZERO_ORIGIN, ZERO_ORIGIN, 190.0, 40.0))
#define TUI_TITLE_VIEW_TITLE_LABEL_FRAME_TOP CGRectIntegral(CGRectMake(ZERO_ORIGIN, 5.0, 190.0, 20.0))
#define TUI_TITLE_VIEW_SUBTITLE_LABEL_FRAME_TOP CGRectIntegral(CGRectMake(ZERO_ORIGIN, 21.0, 190.0, 16.0))


/**
 TUITitleView class extension
 */
@interface TUITitleView ()
@end


@implementation TUITitleView


#pragma mark - Init

+ (instancetype)titleView
{
    return [[[self class] alloc] initWithFrame:CGRectMake(ZERO_ORIGIN, ZERO_ORIGIN, kFrameWidth, kFrameHeight)];
}


#pragma mark - Setup

- (void)setup
{
    [super setup];
    [self setupTitle];
    [self setupSubtitle];
}

- (void)setupTitle
{
    _titleLabel = [[TUIBaseLabel alloc] initWithFrame:CGRectZero];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont fontWithName:BOLD_FONT size:kTitleLabelFontSize];
    [self addSubview:_titleLabel];
}

- (void)setupSubtitle
{
    _subtitleLabel = [[TUIBaseLabel alloc] initWithFrame:CGRectZero];
    _subtitleLabel.textColor = [UIColor whiteColor];
    _subtitleLabel.textAlignment = NSTextAlignmentCenter;
    _subtitleLabel.font = [UIFont fontWithName:REGULAR_FONT size:kSubtitleLabelFontSize];
    [self addSubview:_subtitleLabel];
}

- (void)setupAccessibility
{
    _titleLabel.accessibilityLabel = ACCESSIBILITY_SCREEN_TITLE;
    _titleLabel.isAccessibilityElement = YES;
    _subtitleLabel.accessibilityLabel = ACCESSIBILITY_SCREEN_SUBTITLE;
    _subtitleLabel.isAccessibilityElement = YES;
}


#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self layout];
}

- (void)layout
{
    self.frame = TUI_TITLE_VIEW_ONE_LINE_TITLE_FRAME;
    [self layoutTitle];
}

- (void)layoutTitle
{
    BOOL isSubtitleEmpty = _subtitleLabel.text.length == ZERO_INT;
    if (isSubtitleEmpty)
    {
        _titleLabel.font = [UIFont fontWithName:BOLD_FONT size:kTitleLabelStandaloneFontSize];
        [self layoutOneLine];
    }
    else
    {
        _titleLabel.font = [UIFont fontWithName:BOLD_FONT size:kTitleLabelFontSize];
        [self layoutMultipleLine];
    }
}

- (void)layoutOneLine
{
    _titleLabel.frame = TUI_TITLE_VIEW_TITLE_LABEL_FRAME_CENTER;
    _subtitleLabel.frame = CGRectZero;
    _titleLabel.x = ceilf(((SCREEN_WIDTH - _titleLabel.width) / TWO_FLOAT) - self.x);
}

- (void)layoutMultipleLine
{
    _titleLabel.frame = TUI_TITLE_VIEW_TITLE_LABEL_FRAME_TOP;
    _subtitleLabel.frame = TUI_TITLE_VIEW_SUBTITLE_LABEL_FRAME_TOP;
    _titleLabel.x = ceilf(((SCREEN_WIDTH - _titleLabel.width) / TWO_FLOAT) - self.x);
    _subtitleLabel.x = ceilf(((SCREEN_WIDTH - _subtitleLabel.width) / TWO_FLOAT) - self.x);
}

@end
