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
{
    NSInteger _selectedRow;
}

@end

#define STANDARD_CELL_HEIGHT    89.0f
#define SELECTED_CELL_HEIGHT    178.0f

@implementation TUISpotListTableViewController

#pragma mark - Init

- (void)initData
{
    [super initData];
    
    self.dataSource = [[TUISpotListTableViewDataSource alloc] init];
    self.tableView.dataSource = _dataSource;
    // No selected row
    _selectedRow = -ONE_INT;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, self.tableView.width);
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
    // No selected row
    _selectedRow = -ONE_INT;
    [self.tableView reloadData];
}


#pragma mark - UITableViewDelegate -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _selectedRow)
    {
        return SELECTED_CELL_HEIGHT;
    }
    return STANDARD_CELL_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // update selected row
    _selectedRow = _selectedRow == indexPath.row ? -ONE_INT : indexPath.row;
    
    [tableView beginUpdates];
    [tableView endUpdates];
    
}

@end
