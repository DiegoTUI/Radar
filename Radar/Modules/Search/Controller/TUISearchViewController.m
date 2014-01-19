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
#import "TUISpotsViewController.h"

static NSInteger kNumberOfElementsShownInTheList = 4;
static CGFloat kRowHeight = 89.0f;

@interface TUISearchViewController () <TUISettingsViewControllerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *containerListView;
@property (strong, nonatomic) TUISpotsViewController *spotsViewController;

@end

@implementation TUISearchViewController

#pragma mark - Data
- (void)initData
{
    for (UIViewController *viewController in self.childViewControllers)
    {
        if ([viewController isKindOfClass:[TUISpotsViewController class]])
        {
            _spotsViewController = (TUISpotsViewController *)viewController;
        }
    }
    
}

#pragma mark - User interface

- (void)initUserInterface
{
    [super initUserInterface];
    
    [self initMapView];
    [self initContainerListView];
    [self initContainerFilterView];
}

- (void)initMapView
{
    _mapView.x = ZERO_FLOAT;
    _mapView.y = ZERO_FLOAT;
    _mapView.width = self.view.width;
    _mapView.height = self.view.height - _spotsViewController.handlerImageView.height;
    // delegate
    _mapView.delegate = self;
}

- (void)initContainerListView
{
    _containerListView.x = ZERO_FLOAT;
    _containerListView.y = _mapView.height;
    _containerListView.width = self.view.width;
    _containerListView.height = _spotsViewController.handlerImageView.height + kNumberOfElementsShownInTheList*kRowHeight;
}

- (void)initContainerFilterView
{
    // TODO: set filterView position
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
