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

static NSInteger kPriceButtonCornerRadius   = 5;
static NSInteger kImageViewXPadding         = 44;
static NSInteger kImageViewYPadding         = 10;
static NSInteger kImageViewHeight           = 69;
static NSInteger kImageViewWidth            = 69;


@implementation TUISpotListCell

#pragma mark - Setup -

- (void)setup
{
    [super setup];
    
    //[self setupImage];
    //[self setupCornerImage];
    //[self setupTitleLabel];
    //[self setupSubtitleLabel];
    //[self setupCornerLabel];
    [self setupPriceButton];
    [self setupDescriptionLabel];
}

- (void)setupImage
{
    self.imageView.x = kImageViewXPadding;
    self.imageView.y = kImageViewYPadding;
    self.imageView.width = kImageViewWidth;
    self.imageView.height = kImageViewHeight;
}

- (void)setupPriceButton
{
    _priceButton.layer.borderWidth = ONE_FLOAT;
    _priceButton.layer.borderColor=[[UIColor tuiLightBlueColor] CGColor];
    _priceButton.layer.cornerRadius = kPriceButtonCornerRadius; // this value vary as per your desire
    _priceButton.clipsToBounds = YES;
}

- (void)setupDescriptionLabel
{
    _descriptionLabel.hidden = YES;
}

#pragma mark - Cell types

- (void)atlasTicketCell;
{
    // setup
    [self setup];
    // set icon
    UIImage *icon = [UIImage imageNamed:@"iconlist-tui.png"];
    self.cornerImageView.image = icon;
    // set side bar
    self.sideView.backgroundColor = [UIColor tuiLightGreenColor];
    // set subtitle
    self.subtitleLabel.text = NSLocalizedString(@"ATLAS_GENERIC_SUBTITLE", nil);
}

- (void)foursquareVenueCell
{
    // setup
    [self setup];
    // set icon
    UIImage *icon = [UIImage imageNamed:@"iconlist-fsq.png"];
    self.cornerImageView.image = icon;
    // set side bar
    self.sideView.backgroundColor = [UIColor tuiLightBlueColor];
    // set subtitle
    self.subtitleLabel.text = NSLocalizedString(@"FOURSQUARE_GENERIC_SUBTITLE", nil);
}


@end
