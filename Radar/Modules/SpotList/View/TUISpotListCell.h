//
//  TUISpotListCell.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseTableViewCell.h"

@interface TUISpotListCell : TUIBaseTableViewCell

/**
 The spot image
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/**
 The spot type (TUI or Foursquare) image
 */
@property (weak, nonatomic) IBOutlet UIImageView *cornerImageView;

/**
 The title label
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

/**
 The subtitle label
 */
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

/**
 The description label
 */
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

/**
 The indoor/outdoor label
 */
@property (weak, nonatomic) IBOutlet UILabel *cornerLabel;

/**
 The price button
 */
@property (weak, nonatomic) IBOutlet UIButton *priceButton;

/**
 The side view indicating if the spot is TUI or foursquare
 */
@property (weak, nonatomic) IBOutlet UIView *sideView;

/**
 @methodName atlasTicketCell
 @abstract Sets the appearance of the cell to an ATLAS ticket
 @discussion This method sets the appearance of the cell to an ATLAS ticket
 */
- (void)atlasTicketCell;

/**
 @methodName foursquareVenueCell
 @abstract Sets the appearance of the cell to an Foursquare venue
 @discussion This method sets the appearance of the cell to an Foursquare venue
 */
- (void)foursquareVenueCell;

@end
