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
static NSString *kFakeBidiImageName = @"bidiFake.png";

@interface TUIBookingPageContentViewController ()

@end

@implementation TUIBookingPageContentViewController


#pragma mark - User interface -

- (void)setViewControllerWithAtlasTicket:(TUIAtlasTicket *)atlasTicket
{
    _titleLabel.text = atlasTicket.name;
    _weatherLabel.text = [atlasTicket.indoor boolValue] ? NSLocalizedString(@"INDOOR", nil) : NSLocalizedString(@"OUTDOOR", nil);
    _priceLabel.text = [NSString stringWithFormat:@"%ld", [atlasTicket.price integerValue]];
    _referenceLabel.text = kReferenceNumber;
    _iconTypeImageView.image = [UIImage imageNamed:@"iconlist-tui.png"];
    // Load image asynchronously
    [_thumbImageView setImageWithURL:[NSURL URLWithString:atlasTicket.imageURLs[ZERO_INT]]];
    // Make it circular
    CALayer *imageLayer = _thumbImageView.layer;
    [imageLayer setCornerRadius:_thumbImageView.width/TWO_INT];
    [imageLayer setMasksToBounds:YES];
    _bidiImageView.image = [UIImage imageNamed:kFakeBidiImageName];
}

@end
