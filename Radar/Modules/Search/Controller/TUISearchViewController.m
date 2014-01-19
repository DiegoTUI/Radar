//
//  TUISearchViewController.m
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISearchViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"
// Controllers
#import "TUISettingsViewController.h"

@interface TUISearchViewController () <TUISettingsViewControllerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *containerListView;

@end

@implementation TUISearchViewController

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
    [self.mapView setDelegate:self];
    //[self addGestureRecogniserToMapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User interface

- (void)initUserInterface
{
    [super initUserInterface];
    // TODO: set filterView position
    // Set map position
    // Set spotList position
}


#pragma mark - Shaking -

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self performSegueWithIdentifier:DEVELOPER_SETTINGS_SEGUE sender:self];
    }
}

#pragma mark - TUISettingsViewController delegate -

- (void)saveButtonPressed
{
    [self dismissViewControllerAnimated:YES completion:^{
        //TODO: add reload logic here with the new criteria
    }];
}

- (void)cancelButtonPressed
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Segue -
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:DEVELOPER_SETTINGS_SEGUE])
    {
        TUISettingsViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.delegate = self;
    }
}

@end
