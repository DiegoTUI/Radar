//
//  TUIListActivitiesViewController.h
//  Radar
//
//  Created by jmartin on 16/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TUIListActivitiesViewController : UITableViewController


@property (nonatomic, strong) NSArray *activitiesTitle;
@property (nonatomic, strong) NSArray *activitiesTags;
@property (nonatomic, strong) NSArray *activitiesDescription;
@property (nonatomic, strong) NSArray *activitiesPrice;
@property (nonatomic, strong) NSArray *activitiesTypePlace;

@property (nonatomic, strong) UIImageView *activitiesThumb;
@property (nonatomic, strong) UIImageView *activitiesBadget;


//Data
@property (nonatomic, retain) NSMutableArray *filterActivitiesData;

@end
