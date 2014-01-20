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

static NSInteger kPriceButtonCornerRadius = 5;

@implementation TUISpotListCell

#pragma mark - Setup -

- (void)setup
{
    [super setup];
    
    [self setupPriceButton];
    [self setupDescriptionLabel];
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
}


@end
