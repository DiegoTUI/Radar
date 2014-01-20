//
//  TUISpotListTableViewController_Private.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotListTableViewController.h"
// Forward declarations
@class TUISpotListTableViewDataSource;

/**
 Class extension
 */
@interface TUISpotListTableViewController ()

/**
 The datasource of the search results table view
 */
@property (nonatomic, strong) TUISpotListTableViewDataSource *dataSource;

@end
