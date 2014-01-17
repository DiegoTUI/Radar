//
//  TUIListActivitiesCell.h
//  Radar
//
//  Created by jmartin on 16/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TUIListActivitiesCell : UITableViewCell
{
    NSString *reuseID;
}

@property (strong, nonatomic) IBOutlet UILabel * TitleLabel;
@property (strong, nonatomic) IBOutlet UILabel * TagsLabel;
@property (strong, nonatomic) IBOutlet UILabel * DescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel * PriceLabel;
@property (strong, nonatomic) IBOutlet UILabel * TypePlaceActivityLabel;


@property (strong, nonatomic) IBOutlet UIImageView * ThumbImage;
@property (strong, nonatomic) IBOutlet UIImageView * BadgeTypeActivity;



@end
