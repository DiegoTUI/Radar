//
//  TUISpotListTableViewDataSource.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotList.h"

/**
 Data source for TUISpotListTableView
 */
@interface TUISpotListTableViewDataSource : NSObject <UITableViewDataSource>

/**
 An array containing the search results
 */
@property (nonatomic, strong) TUISpotList *spotList;

/**
 @methodName serveCellsEnabled:
 @abstract Specifies if the data source should serve the cells enabled or disabled
 @discussion This method sets if the data source should serve the cells enabled or disabled
 
 @param flag YES if the cells are to served enabled. NO otherwise.
 */
- (void)serveCellsEnabled:(BOOL)flag;

/**
 @methodName initWithSpotList:
 @abstract Inits the data source with a given spot list
 @discussion This method will return an instance of the data source with the
 spotList property initialized.
 
 @param spotList The given spot list
 
 @return The initialized data source
 */
- (TUISpotListTableViewDataSource *)initWithSpotList:(TUISpotList *)spotList;

@end
