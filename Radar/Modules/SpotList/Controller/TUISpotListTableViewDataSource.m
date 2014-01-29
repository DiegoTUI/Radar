//
//  TUISpotListTableViewDataSource.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotListTableViewDataSource.h"
// Models
#import "TUIAtlasTicket.h"
#import "TUIFoursquareVenue.h"
// Views
#import "TUISpotListCell.h"

static BOOL _serveCellsEnabled = YES;

@implementation TUISpotListTableViewDataSource

#pragma mark - Init -

- (id)init
{
    self = [super init];
    
    if (self)
    {
        // create an empty spotlist
        self.spotList = [[TUISpotList alloc] init];
    }
    
    return self;
}

- (TUISpotListTableViewDataSource *)initWithSpotList:(TUISpotList *)spotList
{
    self = [super init];
    
    if (self)
    {
        // create an empty spotlist
        self.spotList = spotList;
    }
    
    return self;
}


- (void)serveCellsEnabled:(BOOL)flag
{
    _serveCellsEnabled = flag;
}

#pragma mark - UITableViewDataSource delegate -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.spotList.spots.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ONE_INT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TUISpotListCell *cell = [tableView dequeueReusableCellWithIdentifier:[TUISpotListCell reuseIdentifier]];
    
    
    TUISpot *spot = self.spotList.spots[indexPath.row];
    
    NSLog(@"Getting cell for spot: %@ - row: %d - cellsEnabled: %d", spot.name, indexPath.row, _serveCellsEnabled);
    
    // Check for TUI and Foursquare spots
    if ([spot isKindOfClass:[TUIAtlasTicket class]])
    {
        [cell atlasTicketCellWithSpot:(TUIAtlasTicket *)spot];
    }
    else if ([spot isKindOfClass:[TUIFoursquareVenue class]])
    {
        [cell foursquareVenueCellWithSpot:(TUIFoursquareVenue *)spot];
    }
    // Set user interaction and background
    cell.userInteractionEnabled = _serveCellsEnabled;
    cell.contentView.backgroundColor = _serveCellsEnabled ? [UIColor whiteColor] : [UIColor tuiDisabledCellBackgroundColor];
    
    return cell;
}


@end
