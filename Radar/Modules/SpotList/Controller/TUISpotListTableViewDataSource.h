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

@end
