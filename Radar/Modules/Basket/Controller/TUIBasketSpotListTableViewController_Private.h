//
//  TUIBasketSpotListTableViewController_Private.h
//  Radar
//
//  Created by Diego Lafuente on 31/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasketSpotListTableViewController.h"
// Extensions
#import "TUIBaseTableViewController_Private.h"

//Forward declarations
@class TUIBasketSpotListTableViewDataSource;

/**
 Private properties and methods of the basket spot list table view controller
 */
@interface TUIBasketSpotListTableViewController ()

/**
 The datasource of the search results table view
 */
@property (nonatomic, strong) TUIBasketSpotListTableViewDataSource *dataSource;

@end
