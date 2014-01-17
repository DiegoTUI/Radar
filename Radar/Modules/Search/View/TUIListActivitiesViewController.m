//
//  TUIListActivitiesViewController.m
//  Radar
//
//  Created by jmartin on 16/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIListActivitiesViewController.h"
#import "TUIListActivitiesCell.h"

@interface TUIListActivitiesViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation TUIListActivitiesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // LOAD DATA
    self.dataSource = [NSMutableArray array];
    [self.dataSource addObject:[NSArray arrayWithObjects:
                                @"Soho promenade",
                                @"Street, walk, outside, city",
                                @"100€",
                                @"OUTDOOR",
                                @"iconlist-fsq.png",
                                @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.",
                                @"actividadImg.png", nil]];
    [self.dataSource addObject:[NSArray arrayWithObjects:
                                @"Bike riding",
                                @"Street, walk, outside, city, outside, city",
                                @"9000€",
                                @"OUTDOOR",
                                @"iconlist-tui.png",
                                @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.",
                                @"actividadImg2.png", nil]];
    [self.dataSource addObject:[NSArray arrayWithObjects:
                                @"Market café",
                                @"Street, walk",
                                @"25€",
                                @"INDOOR",
                                @"iconlist-tui.png",
                                @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.",
                                @"actividadImg3.png", nil]];
    [self.dataSource addObject:[NSArray arrayWithObjects:
                                @"Royal Palace Victoria Restaurant Golf Chef",
                                @"Street, walk, outside, city",
                                @"100€",
                                @"INDOOR",
                                @"iconlist-fsq@2x.png",
                                @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.",
                                @"actividadImg.jpg", nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ActivityCell";
    TUIListActivitiesCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSArray *cellInfoArray = [self.dataSource objectAtIndex:indexPath.row];
    
    cell.TitleLabel.text = [cellInfoArray objectAtIndex:0];
    cell.TagsLabel.text = [cellInfoArray objectAtIndex:1];
    cell.PriceLabel.text = [cellInfoArray objectAtIndex:2];
    cell.DescriptionLabel.text = [cellInfoArray objectAtIndex:5];
    cell.TypePlaceActivityLabel.text = [cellInfoArray objectAtIndex:3];
    
    cell.BadgeTypeActivity.image = [UIImage imageNamed: [cellInfoArray objectAtIndex:4]];
    cell.ThumbImage.image = [UIImage imageNamed: [cellInfoArray objectAtIndex:6]];
    
    
    
    return cell;
}



@end
