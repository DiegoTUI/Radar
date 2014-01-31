//
//  TUIBasketSpotListTableViewDataSource.h
//  Radar
//
//  Created by Diego Lafuente on 31/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

// Forward declarations
@class TUISpotList;

/**
 Data source for the basket spot list table
 */
@interface TUIBasketSpotListTableViewDataSource : NSObject<UITableViewDataSource>

/**
 An array containing the search results
 */
@property (nonatomic, strong) TUISpotList *spotList;

/**
 @methodName initWithSpotList:
 @abstract Inits the data source with a given spot list
 @discussion This method will return an instance of the data source with the
 spotList property initialized.
 
 @param spotList The given spot list
 
 @return The initialized data source
 */
- (TUIBasketSpotListTableViewDataSource *)initWithSpotList:(TUISpotList *)spotList;

@end
