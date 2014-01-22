//
//  TUIWeatherPageViewControllerDataSource.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIWeatherPageViewControllerDataSource.h"
// Controllers
#import "TUIFilterContentViewController.h"

@interface TUIWeatherPageViewControllerDataSource ()

@end

@implementation TUIWeatherPageViewControllerDataSource


#pragma mark - Init -

- (TUIWeatherPageViewControllerDataSource *)init
{
    self = [super init];
    if (self)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        TUIFilterContentViewController *indoorFilterView = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        [indoorFilterView.label setText:@"Indoor"];
        indoorFilterView.pageIndex = 0;
        
        //indoorFilterView.iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconfilter-indoor.png"]];
        
        TUIFilterContentViewController *outdoorFilterView = [storyboard instantiateViewControllerWithIdentifier:@"TUIFilterContentViewController"];
        outdoorFilterView.pageIndex = 1;
        [indoorFilterView.label setText:@"Outdoor"];
        //indoorFilterView.iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconfilter-outdoor.png"]];
        
        self.viewControllers = @[indoorFilterView, outdoorFilterView];
    }
    return self;
}



@end
