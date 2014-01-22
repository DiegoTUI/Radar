//
//  TUIFilterContentViewController.h
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"

@interface TUIFilterContentViewController : TUIBaseViewController

@property (nonatomic) NSUInteger pageIndex;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
