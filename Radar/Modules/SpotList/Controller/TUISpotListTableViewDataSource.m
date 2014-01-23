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
    // Check for TUI and Foursquare spots
    if ([spot isKindOfClass:[TUIAtlasTicket class]])
    {
        [cell atlasTicketCell];
        [self setImage:spot.imageURLs[0] inCell:cell];
        cell.cornerLabel.text = [[(TUIAtlasTicket *)spot indoor] boolValue] ? NSLocalizedString(@"INDOOR", nil) : NSLocalizedString(@"OUTDOOR", nil);
    }
    else if ([spot isKindOfClass:[TUIFoursquareVenue class]])
    {
        [cell foursquareVenueCell];
    }
    
    cell.titleLabel.text = spot.name;
    cell.descriptionLabel.text = spot.descriptionBody;
    
    return cell;
}


#pragma mark - Thumbnail -

- (void)setImage:(NSString *)imageURL
          inCell:(TUISpotListCell *)cell
{
    // Load Image
    UIImage *thumbnail = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
    // Shrink image to fit the size of the image view
    CGSize imageSize = CGSizeMake(cell.imageView.width, cell.imageView.height);
    UIGraphicsBeginImageContext(imageSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, imageSize.width, imageSize.height);
    [thumbnail drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // Make it circular
    CALayer *imageLayer = cell.imageView.layer;
    [imageLayer setCornerRadius:cell.imageView.width/TWO_INT];
    [imageLayer setMasksToBounds:YES];
}

@end
