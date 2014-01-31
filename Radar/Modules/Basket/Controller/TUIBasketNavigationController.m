//
//  TUIBasketNavigationController.m
//  Radar
//
//  Created by Diego Lafuente on 31/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasketNavigationController.h"

@interface TUIBasketNavigationController ()

@end

@implementation TUIBasketNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    /*NSDictionary *textAttributes = @{NSForegroundColorAttributeName:[UIColor tuiLightGreenColor],
                                     NSFontAttributeName:[UIFont fontWithName:REGULAR_FONT size:TITLE_SECTION_FONT_SIZE],
                                     NSForegroundColorAttributeName: [NSValue valueWithUIOffset:UIOffsetZero],
                                     };*/
    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.tintColor = [UIColor tuiLightGreenColor];
    //[self.navigationBar setTitleTextAttributes:textAttributes];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
