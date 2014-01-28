//
//  TUISpotListCell.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotListCell.h"
#import <QuartzCore/QuartzCore.h>
// Extensions
#import "TUIBaseTableViewCell_Private.h"
// Models
#import "TUIAtlasTicket.h"
#import "TUIFoursquareVenue.h"
// Categories
#import "UIImageView+AFNetworking.h"

static NSInteger kPriceButtonCornerRadius           = 5;
static NSInteger kImageViewXPadding                 = 22;
static NSInteger kImageViewYPadding                 = 10;
static NSInteger kImageViewHeight                   = 69;
static NSInteger kImageViewWidth                    = 69;
static NSInteger kCornerImageViewXPadding           = 72;
static NSInteger kCornerImageViewYPadding           = 6;
static NSInteger kCornerImageViewHeight             = 22;
static NSInteger kCornerImageViewWidth              = 22;

#define DESCRIPTION_LABEL_ANIMATION_DURATION        0.3f


@interface TUISpotListCell()

@end

@implementation TUISpotListCell

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

}

- (void)setupMainImage
{
    _mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kImageViewXPadding, kImageViewYPadding, kImageViewWidth, kImageViewHeight)];
    
    [self addSubview:_mainImageView];
}

- (void)setupCornerImage
{
    _cornerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kCornerImageViewXPadding, kCornerImageViewYPadding, kCornerImageViewWidth, kCornerImageViewHeight)];
    
    [self addSubview:_cornerImageView];
}

- (void)setupPriceButton
{
    _priceButton.layer.borderWidth = ONE_FLOAT;
    _priceButton.layer.borderColor=[[UIColor tuiLightBlueColor] CGColor];
    _priceButton.layer.cornerRadius = kPriceButtonCornerRadius; // this value vary as per your desire
    _priceButton.clipsToBounds = YES;
    [_priceButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
}

- (void)setupDescriptionLabel
{
    _descriptionLabel.numberOfLines = ZERO_INT;
    _descriptionLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _descriptionLabel.alpha = ZERO_FLOAT;
    _descriptionLabel.hidden = YES;
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
    [self setMainImage:spot.imageURLs[0]];
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
    _priceButton.titleLabel.text = [NSString stringWithFormat:@"%ld€", [spot.price longValue]];
    // show price button
    _priceButton.hidden = NO;
}

- (void)foursquareVenueCellWithSpot:(TUIFoursquareVenue *)spot
{
    // setup
    [self setup];
    // set icon
    UIImage *icon = [UIImage imageNamed:@"iconlist-fsq.png"];
    _cornerImageView.image = icon;
    // main image
    [self setMainImage:@"http://www.digitaltrends.com/wp-content/uploads/2012/08/restaurant.jpeg"];
    // title
    _titleLabel.text = spot.name;
    // description
    _descriptionLabel.text = spot.descriptionBody;
    // set side bar
    _sideView.backgroundColor = [UIColor tuiLightBlueColor];
    // set subtitle
    _subtitleLabel.text = NSLocalizedString(@"FOURSQUARE_GENERIC_SUBTITLE", nil);
    // hide corner label
    _cornerLabel.hidden = YES;
    // hide price button
    _priceButton.hidden = YES;
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


#pragma mark - Show/hide description label -

- (void)showDescriptionLabelAnimated
{
    _descriptionLabel.hidden = NO;
    [UIView animateWithDuration:DESCRIPTION_LABEL_ANIMATION_DURATION animations:^{
        _descriptionLabel.alpha = 1;
    }];
}

- (void)hideDescriptionLabelAnimated
{
    [UIView animateWithDuration:DESCRIPTION_LABEL_ANIMATION_DURATION animations:^{
        _descriptionLabel.alpha = 0;
    } completion: ^(BOOL finished) {
        _descriptionLabel.hidden = finished;
    }];
}

@end
