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
// Views
#import "TUISpotListCell.h"


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
    
    _dataSource = [[TUISpotListTableViewDataSource alloc] init];
    [_dataSource serveCellsEnabled:YES];
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
    
    // show/hide description. Enable/disable user interaction.
    TUISpotListCell *cell = (TUISpotListCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (_selectedRow == indexPath.row)
    {
        // the row has been selected. Show description
        [cell showDescriptionLabelAnimated];
        // disable user interacion in all cells but this one
        [self disableUserInteractionForAllCellsExceptForRow:_selectedRow];
        // scroll selected row to visible
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        // disable scroll
        tableView.scrollEnabled = NO;
        // call the row select block
        _rowSelectedBlock(_selectedRow);
    }
    else
    {
        // the row has been deselected. Hide description
        [cell hideDescriptionLabelAnimated];
        // enable user interaction in all cells
        [self enableUserInteractionForAllCells];
        // enable scroll
        tableView.scrollEnabled = YES;
        // call the row select block
        _rowDeselectedBlock(indexPath.row);
    }
    
    [tableView endUpdates];
}


#pragma mark - Enable/Disable user interaction -

- (void)enableUserInteractionForAllCells
{
    [_dataSource serveCellsEnabled:YES];
    for (int i = 0; i < [self.tableView numberOfRowsInSection:ZERO_INT]; i++)
    {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:ZERO_INT]];
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.userInteractionEnabled = YES;
    }
}

- (void)disableUserInteractionForAllCellsExceptForRow:(NSInteger)row
{
    [_dataSource serveCellsEnabled:NO];
    for (int i = 0; i < [self.tableView numberOfRowsInSection:ZERO_INT]; i++)
    {
        if (i != row)
        {
            TUISpotListCell *cell = (TUISpotListCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:ZERO_INT]];
            cell.contentView.backgroundColor = [UIColor tuiDisabledCellBackgroundColor];
            cell.userInteractionEnabled = NO;
        }
    }
}


#pragma mark - Deselect all rows -

- (void)deselectAllRows
{
    if (_selectedRow != -ONE_INT)
    {
        [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedRow inSection:ZERO_INT]];
    }
}

@end
