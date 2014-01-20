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


@implementation TUISpotListTableViewDataSource

#pragma mark - Init

- (id)init
{
    self = [super init];
    
    if (self)
    {
        //TODO: extra initialization here
        self.spotList = [TUISpotList testSpotList];
    }
    
    return self;
}


#pragma mark - UITableViewDataSource

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
    // Check for TUI and Foursquare spots
    if ([spot isKindOfClass:[TUIAtlasTicket class]])
    {
        [cell atlasTicketCell];
    }
    else if ([spot isKindOfClass:[TUIFoursquareVenue class]])
    {
        [cell foursquareVenueCell];
    }
    return cell;
}

@end
