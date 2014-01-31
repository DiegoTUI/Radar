//
//  TUIBasketListCell.m
//  Radar
//
//  Created by Diego Lafuente on 31/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasketListCell.h"
// Extensions
#import "TUIBaseTableViewCell_Private.h"
// Models
#import "TUIAtlasTicket.h"
// Categories
#import "UIImageView+AFNetworking.h"

static const NSInteger kSlidePadding                      = 30;
static const NSInteger kPriceButtonCornerRadius           = 5;
static const NSInteger kImageViewXPadding                 = 22;
static const NSInteger kImageViewYPadding                 = 10;
static const NSInteger kImageViewHeight                   = 69;
static const NSInteger kImageViewWidth                    = 69;
static const NSInteger kCornerImageViewXPadding           = 72;
static const NSInteger kCornerImageViewYPadding           = 6;
static const NSInteger kCornerImageViewHeight             = 22;
static const NSInteger kCornerImageViewWidth              = 22;

#define DEFAULT_ANIMATION_DURATION        0.3f
#define DISABLED_BUTTON_ALPHA             0.4f

@implementation TUIBasketListCell

#pragma mark - Setup -

- (void)setup
{
    [super setup];
    
    [self setupMainImage];
    [self setupCornerImage];
    //[self setupTitleLabel];
    //[self setupSubtitleLabel];
    //[self setupCornerLabel];
    [self setupPriceButton];
    [self setupDescriptionLabel];
    //[self setupSeparator];
    [self setupAddedToBasketTick];
    
}

- (void)setupMainImage
{
    _mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kImageViewXPadding + kSlidePadding, kImageViewYPadding, kImageViewWidth, kImageViewHeight)];
    
    [self addSubview:_mainImageView];
}

- (void)setupCornerImage
{
    _cornerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kCornerImageViewXPadding + kSlidePadding, kCornerImageViewYPadding, kCornerImageViewWidth, kCornerImageViewHeight)];
    
    [self addSubview:_cornerImageView];
}

- (void)setupPriceButton
{
    _priceButton.layer.borderWidth = ONE_FLOAT;
    _priceButton.layer.borderColor=[[UIColor tuiLightBlueColor] CGColor];
    _priceButton.layer.cornerRadius = kPriceButtonCornerRadius; // this value vary as per your desire
    _priceButton.clipsToBounds = YES;
    [_priceButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    _priceButton.enabled = NO;
}

- (void)setupDescriptionLabel
{
    _descriptionLabel.numberOfLines = ZERO_INT;
    _descriptionLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _descriptionLabel.alpha = ZERO_FLOAT;
    _descriptionLabel.hidden = YES;
}

- (void)setupAddedToBasketTick
{
}

#pragma mark - Cell types -

- (void)atlasTicketCellWithSpot:(TUIAtlasTicket *)spot
{
    // setup
    [self setup];
    // set icon
    UIImage *icon = [UIImage imageNamed:@"iconlist-tui.png"];
    _cornerImageView.image = icon;
    // main image
    [self setMainImage:spot.imageURLs[ZERO_INT]];
    // title
    _titleLabel.text = spot.name;
    // description
    _descriptionLabel.text = spot.descriptionBody;
    // corner label
    _cornerLabel.text = [spot.indoor boolValue] ? NSLocalizedString(@"INDOOR", nil) : NSLocalizedString(@"OUTDOOR", nil);
    // set side bar
    _sideView.backgroundColor = [UIColor tuiLightGreenColor];
    // set subtitle
    _subtitleLabel.text = NSLocalizedString(@"ATLAS_GENERIC_SUBTITLE", nil);
    // show corner label
    _cornerLabel.hidden = NO;
    // price
    [_priceButton setTitle:[NSString stringWithFormat:@"%ld€", [spot.price longValue]] forState:UIControlStateNormal];
    // show price button
    _priceButton.hidden = NO;
    // disable price button
    _priceButton.enabled = NO;
    // Reduce its alpha
    _priceButton.alpha = DISABLED_BUTTON_ALPHA;
}

#pragma mark - Main image -

- (void)setMainImage:(NSString *)imageURL
{
    // Load image asynchronously
    [_mainImageView setImageWithURL:[NSURL URLWithString:imageURL]];
    // Make it circular
    CALayer *imageLayer = _mainImageView.layer;
    [imageLayer setCornerRadius:_mainImageView.width/TWO_INT];
    [imageLayer setMasksToBounds:YES];
}

@end
