//
//  TUIBookingPageContentViewController.m
//  Radar
//
//  Created by jmartin on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBookingPageContentViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"
// Models
#import "TUIAtlasTicket.h"
// Categories
#import "UIImageView+AFNetworking.h"

static NSString *kReferenceNumber = @"65452";
static NSString *kFakeBidiImageName = @"bidiFake.jpg";

@interface TUIBookingPageContentViewController ()

@property (strong, nonatomic) NSString *titleText;
@property (strong, nonatomic) NSString *weatherText;
@property (strong, nonatomic) NSString *priceText;
@property (strong, nonatomic) NSString *imageUrl;

@end

@implementation TUIBookingPageContentViewController


#pragma mark - User interface -

- (void)initUserInterface
{
    [super initUserInterface];
    
    _titleLabel.text = _titleText;
    _weatherLabel.text = _weatherText;
    _priceLabel.text = _priceText;
    _referenceLabel.text = kReferenceNumber;
    _iconTypeImageView.image = [UIImage imageNamed:@"iconlist-tui.png"];
    [_thumbImageView setImageWithURL:[NSURL URLWithString:_imageUrl]];
    // Make it circular
    CALayer *imageLayer = _thumbImageView.layer;
    [imageLayer setCornerRadius:_thumbImageView.width/TWO_INT];
    [imageLayer setMasksToBounds:YES];
    _bidiImageView.image = [UIImage imageNamed:kFakeBidiImageName];
}

- (void)setViewControllerWithAtlasTicket:(TUIAtlasTicket *)atlasTicket
{
    _titleText = atlasTicket.name;
    _weatherText = [atlasTicket.indoor boolValue] ? NSLocalizedString(@"INDOOR", nil) : NSLocalizedString(@"OUTDOOR", nil);
    _priceText = [NSString stringWithFormat:@"%d €", [atlasTicket.price intValue]];
    _imageUrl = atlasTicket.imageURLs[ZERO_INT];
}

@end
