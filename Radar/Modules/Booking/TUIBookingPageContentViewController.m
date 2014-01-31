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

@interface TUIBookingPageContentViewController ()

@end

@implementation TUIBookingPageContentViewController

- (void)initData
{
    [super initData];
    
}


#pragma mark - User interface -

- (void)initUserInterface
{
    [super initUserInterface];
    
    self.titleLabel.text = self.titleString;
    self.weatherLabel.text = self.weatherString;
    self.priceLabel.text = self.priceString;
    self.referenceLabel.text = [NSString stringWithFormat:@"Ref: %@",self.referenceNumber];
    
    self.thumbImageView.image = [UIImage imageNamed:self.thumbString];
    self.iconTypeImageView.image = [UIImage imageNamed:self.iconTypeString];
    //self.bidiImageView.image = [UIImage imageNamed:self.bidiString];
}

@end
