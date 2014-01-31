//
//  TUIBasketSpotListTableViewDataSource.m
//  Radar
//
//  Created by Diego Lafuente on 31/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasketSpotListTableViewDataSource.h"
// Models
#import "TUISpotList.h"
#import "TUIAtlasTicket.h"
// Views
#import "TUIBasketListCell.h"

@implementation TUIBasketSpotListTableViewDataSource

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

- (TUIBasketSpotListTableViewDataSource *)initWithSpotList:(TUISpotList *)spotList
{
    self = [super init];
    
    if (self)
    {
        // create an empty spotlist
        self.spotList = spotList;
    }
    
    return self;
}


#pragma mark - UITableViewDataSource delegate -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Basket list length: %lu", (unsigned long)self.spotList.spots.count);
    return self.spotList.spots.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ONE_INT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TUIBasketListCell *cell = [tableView dequeueReusableCellWithIdentifier:[TUIBasketListCell reuseIdentifier]];
    
    
    TUIAtlasTicket *spot = self.spotList.spots[indexPath.row];
    
    NSLog(@"Basket list - Getting cell for spot: %@ - row: %ld", spot.name, (long)indexPath.row);
    
    [cell atlasTicketCellWithSpot:(TUIAtlasTicket *)spot];
    
    return cell;
}

@end
