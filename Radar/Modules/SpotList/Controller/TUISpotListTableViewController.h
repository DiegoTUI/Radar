//
//  TUISpotListTableViewController.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseTableViewController.h"

@interface TUISpotListTableViewController : TUIBaseTableViewController <UITableViewDelegate>

/**
 The row selected block. called when a row in the list is selected.
 */
@property (nonatomic,copy) void (^rowSelectedBlock)(NSInteger);

/**
 The row deselected block. called when a row in the list is deselected.
 */
@property (nonatomic,copy) void (^rowDeselectedBlock)(NSInteger);

/**
 @methodName deselectAllRows
 @abstract Deselects all rows in the table
 @discussion This method deselects all rows in the table
 */
- (void)deselectAllRows;

@end
