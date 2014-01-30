//
//  TUISpotAddRemoveProtocol.h
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

// Forward declarations
@class TUISpotListCell;

/**
 Objects who display spots must adopt the TUISpotAddRemoveDelegate. The delegate
 handles the add/remove button events for buttons which are displayed within each cell
 */
@protocol TUISpotAddRemoveDelegate <NSObject>

/**
 @methodName addSpotButtonPressedInCell:
 @abstract Informs the delegate that an add button was pressed
 @discussion This method will inform the delegate that an add button
 was pressed and in which object the button was pressed in
 
 @param sender The cell which contains the add button
 */
- (void)addSpotButtonPressedInCell:(TUISpotListCell *)sender;

/**
 @methodName removeSpotButtonPressed:
 @abstract Informs the delegate that a remove button was pressed
 @discussion This method will inform the delegate that a remove button
 was pressed and in which object the button was pressed in
 
 @param sender The cell which contains the add button
 */
- (void)removeSpotButtonPressedInCell:(TUISpotListCell *)sender;

@end
