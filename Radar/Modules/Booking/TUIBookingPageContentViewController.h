//
//  TUIBookingPageContentViewController.h
//  Radar
//
//  Created by jmartin on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"
// Forward declarations
@class TUIAtlasTicket;

@interface TUIBookingPageContentViewController : TUIBaseViewController

@property (nonatomic) NSUInteger pageIndex;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *referenceLabel;
@property (weak, nonatomic) NSString *titleString;
@property (weak, nonatomic) NSString *weatherString;
@property (weak, nonatomic) NSString *priceString;
@property (weak, nonatomic) NSString *referenceNumber;

@property (nonatomic) IBOutlet UIImageView *thumbImageView;
@property (nonatomic) IBOutlet UIImageView *iconTypeImageView;
@property (nonatomic) IBOutlet UIImageView *bidiImageView;
@property (nonatomic) NSString *thumbString;
@property (nonatomic) NSString *iconTypeString;
@property (nonatomic) NSString *bidiString;

- (void)setViewControllerWithAtlasTicket:(TUIAtlasTicket *)atlasTicket;

@end
