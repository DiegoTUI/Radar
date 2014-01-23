//
//  TUIFilterContentViewController.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIFilterContentViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"

@interface TUIFilterContentViewController ()

@end

@implementation TUIFilterContentViewController

- (void)initData
{
    [super initData];
    
    
}


#pragma mark - User interface -

- (void)initUserInterface
{
    [super initUserInterface];
    
    self.label.text = self.labelString;
    [self.iconView setImage:[UIImage imageNamed:self.iconNameString]];
}

@end
