//
//  TUISpotsViewController.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"

// Forward declarations
@protocol TUISpotsViewControllerDelegate;
@class TUISpotList;

@interface TUISpotsViewController : TUIBaseViewController

/**
 The TUISpotsViewController delegate
 */
@property (nonatomic, weak) id<TUISpotsViewControllerDelegate> delegate;

/**
 Indicates if the list is displayed
 */
@property (nonatomic) BOOL displayed;

/**
 @methodName handlerButton
 @abstract Returns the handler button
 @discussion This method returns the handler button
 
 @return The handler button
 */
- (UIButton *)handlerButton;

/**
 @methodName spotListContainerView
 @abstract Returns the spot list container view
 @discussion This method returns the spot list container view
 
 @return The spot list container view
 */
- (UIView *)spotListContainerView;

/**
 @methodName currentSpotList
 @abstract Returns the spot list currently displayed in the list
 @discussion This method returns the spot list currently displayed in the list
 
 @return The pot list currently displayed in the list
 */
- (TUISpotList *)currentSpotList;

/**
 @methodName reloadSpotsWithSpotList:
 @abstract Reloads the table view contents with the provided spot list
 @discussion This method reloads the table view contents with the provided spot list
 */
- (void)reloadSpotsWithSpotList:(TUISpotList *)spotList;

/**
 @methodName deselectAllRows
 @abstract Deselects all rows in the table
 @discussion This method deselects all rows in the table
 */
- (void)deselectAllRows;

/**
 @methodName scrollTableToRowAtIndexPath:
 @abstract Scrolls the table to the row at the given index path
 @discussion This method scrolls the table to the row at the given index path
 
 @param indexPath The index path of the cell to scroll to
 */
- (void)scrollTableToRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 @methodName selectRowAtIndexPath:
 @abstract Selects the row in the table at the given index path
 @discussion This method selects the row in the table at the given index path
 
 @param indexPath The index path of the cell to select
 */
- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

/**
 The delegate for TUISpotsViewController to dispatch when the handler button has been pressed
 */
@protocol TUISpotsViewControllerDelegate <NSObject>

@required

/**
 Tell the delegate to display the list
 */
- (void)displayListCompletion:(void(^)(BOOL finished))completion;

/**
 Tell the delegate to hide the list
 */
- (void)hideListCompletion:(void(^)(BOOL finished))completion;

/**
 Tell the delegate that a row was selected
 */
- (void)rowSelected:(NSInteger)row;

/**
 Tell the delegate that a row was deselected
 */
- (void)rowDeselected:(NSInteger)row;

@end
