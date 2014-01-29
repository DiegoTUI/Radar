//
//  TUISpotListCell.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseTableViewCell.h"
// Forward declarations
@class TUIAtlasTicket;
@class TUIFoursquareVenue;
@protocol TUISpotAddRemoveDelegate;

@interface TUISpotListCell : TUIBaseTableViewCell

/**
 The cells remove add delegate
 */
@property (nonatomic, weak) id <TUISpotAddRemoveDelegate> delegate;

/**
 The spot image
 */
@property (strong, nonatomic) UIImageView *mainImageView;

/**
 The spot type (TUI or Foursquare) image
 */
@property (strong, nonatomic) UIImageView *cornerImageView;

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
 @methodName atlasTicketCellWithSpot:
 @abstract Sets the appearance of the cell to an ATLAS ticket
 @discussion This method sets the appearance of the cell to an ATLAS ticket
 and fills the different UI items with the provided spot
 
 @param spot The TUIAtlasTicket to configure this cell
 */
- (void)atlasTicketCellWithSpot:(TUIAtlasTicket *)spot;

/**
 @methodName foursquareVenueCellWithSpot:
 @abstract Sets the appearance of the cell to an Foursquare venue
 @discussion This method sets the appearance of the cell to an Foursquare venue
 and fills the different UI items with the provided spot
 
 @param spot The TUIFoursquareVenue to configure this cell
 */
- (void)foursquareVenueCellWithSpot:(TUIFoursquareVenue *)spot;

/**
 @methodName showDescriptionLabelAnimated
 @abstract Shows the description label with a slight animation
 @discussion This method shows the description label with a slight animation
 */
- (void)showDescriptionLabelAnimated;

/**
 @methodName hideDescriptionLabelAnimated
 @abstract Hides the description label with a slight animation
 @discussion This method hides the description label with a slight animation
 */
- (void)hideDescriptionLabelAnimated;

@end
