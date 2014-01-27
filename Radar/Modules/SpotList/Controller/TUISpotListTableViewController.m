//
//  TUISpotListTableViewController.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotListTableViewController.h"
// Extensions
#import "TUISpotListTableViewController_Private.h"
// Controllers
#import "TUISpotListTableViewDataSource.h"


@interface TUISpotListTableViewController () <UITableViewDelegate>

@end

#define STANDARD_CELL_HEIGHT    89.0f

@implementation TUISpotListTableViewController

#pragma mark - Init

- (void)initData
{
    [super initData];
    
    self.dataSource = [[TUISpotListTableViewDataSource alloc] init];
    self.tableView.dataSource = _dataSource;
}

- (void)initUserInterface
{
    [super initUserInterface];
    
    [self registerTableViewCells];
}

- (void)registerTableViewCells
{
    // If we did register the cells programmatically, we would do it here - [self.tableView registerClass:[TUISpotListCell class] forCellReuseIdentifier:[TUISpotListCell reuseIdentifier]];

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
