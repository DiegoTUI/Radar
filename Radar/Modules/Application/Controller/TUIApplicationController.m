//
//  TUIApplicationController.m
//  Radar
//
//  Created by Diego Lafuente on 13/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIApplicationController.h"
// Models
#import "AFNetworkActivityIndicatorManager.h"
#import "UIColor+TUIColors.h"

@implementation TUIApplicationController

#pragma mark - Application lifecycle

- (id)initApplication:(UIApplication *)application withLaunchOptions:(NSDictionary *)options
{
    self = [super init];
    if (self)
    {
        // Force light status bar
        if ([application respondsToSelector:@selector(setStatusBarStyle:)])
        {
            application.statusBarStyle = UIStatusBarStyleLightContent;
        }
        
        // Enable network spinner
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        
        // TODO: Wipe keychain if app was reinstalled
        
        
        // Set global user interface appearance
        [self setGlobalAppearance];
        
        
    }
    
    return self;
}


#pragma mark - Global appearance

- (void)setGlobalAppearance
{
    [self setGlobalBarButtonAppearance];
    [self setGlobalNavigationBarTitleAppearance];
}

- (void)setGlobalBarButtonAppearance
{
    NSDictionary *normalAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                       NSFontAttributeName: [UIFont fontWithName:REGULAR_FONT size:TITLE_SECTION_FONT_SIZE],
                                       NSForegroundColorAttributeName: [NSValue valueWithUIOffset:UIOffsetZero],
                                       };
    
    NSDictionary *highlightedAttributes = @{NSForegroundColorAttributeName: [UIColor tuiLightBlueColor],
                                            NSFontAttributeName: [UIFont fontWithName:REGULAR_FONT size:TITLE_SECTION_FONT_SIZE],
                                            NSForegroundColorAttributeName: [NSValue valueWithUIOffset:UIOffsetZero],
                                            };
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:normalAttributes      forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
    // Set flat purple background in iOS 6
    if (SYSTEM_VERSION_LESS_THAN_7)
    {
        UIImage *image = [UIImage imageNamed:@"images/shared/shared_pixel_purple.png"];
        [[UIBarButtonItem appearance] setBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackgroundImage:image forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }
}

- (void)setGlobalNavigationBarTitleAppearance
{
    // Modify navigation bar title appearance
    NSDictionary *textAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                     NSFontAttributeName:[UIFont fontWithName:BOLD_FONT size:TITLE_SECTION_FONT_SIZE],
                                     NSForegroundColorAttributeName: [NSValue valueWithUIOffset:UIOffsetZero],
                                     };
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
    //self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    if (SYSTEM_VERSION_LESS_THAN_7)
    {
        // Set flat purple background in iOS6
        UIImage *image = [UIImage imageNamed:@"images/shared/shared_pixel_purple.png"];
        [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
        // Remove shadow below bar in iOS6
        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    }
}

@end
