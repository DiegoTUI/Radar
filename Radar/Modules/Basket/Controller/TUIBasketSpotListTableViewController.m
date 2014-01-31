//
//  TUIBasketSpotListTableViewController.m
//  Radar
//
//  Created by Diego Lafuente on 31/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasketSpotListTableViewController.h"
// Extensions
#import "TUIBasketSpotListTableViewController_Private.h"
// Views
#import "TUISpotListCell.h"
// Controllers
#import "TUIBasketSpotListTableViewDataSource.h"

@interface TUIBasketSpotListTableViewController () <UITableViewDelegate>

@end

@implementation TUIBasketSpotListTableViewController

#pragma mark - Init

- (void)initData
{
    [super initData];
    
    _dataSource = [[TUIBasketSpotListTableViewDataSource alloc] init];
    self.tableView.dataSource = _dataSource;
}

- (void)initUserInterface
{
    [super initUserInterface];
    [self registerTableViewCells];
}

- (void)registerTableViewCells
{
    
}

#pragma mark - Update

- (void)updateData
{
    [super updateData];
    
    self.tableView.dataSource = _dataSource;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return STANDARD_CELL_HEIGHT;
}


@end
