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
// Models
#import "TUILocationManager.h"
#import "TUISettings.h"
#import "TUISpotList+Proxy.h"
// Controllers
#import "TUISettingsViewController.h"
#import "TUISpotsViewController.h"
#import "TUIFilterListViewController.h"
// Views
#import "TUIUserLocationAnnotationView.h"


@interface TUISearchViewController () <TUISettingsViewControllerDelegate, MKMapViewDelegate, TUISpotsViewControllerDelegate, TUIFilterListViewControllerDelegate, TUILocationManagerDelegate>

/**
 The map view
 */
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

/**
 The container view for the list of spots
 */
@property (weak, nonatomic) IBOutlet UIView *containerListView;

/**
 The container view for the filters
 */
@property (weak, nonatomic) IBOutlet UIView *containerFilterView;

/**
 The spots view controller (contained in containerListView)
 */
@property (strong, nonatomic) TUISpotsViewController *spotsViewController;

/**
 The filter list view controller (contained in containerFilterView)
 */
@property (strong, nonatomic) TUIFilterListViewController *filterListViewController;

/**
 The current list of spots
 */
@property (strong, nonatomic) TUISpotList *spotList;

@end

@implementation TUISearchViewController


#pragma mark - Data

- (void)initData
{
    [super initData];
    
    [self initViewControllers];
}

- (void)initViewControllers
{
    // get the filter and spot list view controllers
    for (UIViewController *viewController in self.childViewControllers)
    {
        if ([viewController isKindOfClass:[TUISpotsViewController class]])
        {
            _spotsViewController = (TUISpotsViewController *)viewController;
            _spotsViewController.delegate = self;
        }
        else if ([viewController isKindOfClass:[TUIFilterListViewController class]])
        {
            _filterListViewController = (TUIFilterListViewController *)viewController;
            _filterListViewController.delegate = self;
        }
    }
}

- (void)updateSpotListForLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude radius:(NSInteger)radius
{
    typeof(self) __weak weakSelf = self;
    [TUISpotList spotsForLatitude:latitude longitude:longitude radius:radius completion:^(TUISpotList *spotList) {
        typeof(self) __strong strongSelf = weakSelf;
        if (!strongSelf) return;
        
        strongSelf.spotList = spotList;
        [_spotsViewController reloadSpotsWithSpotList:spotList];
        
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - User interface

- (void)initUserInterface
{
    [super initUserInterface];
#ifndef TESTING
    [self initMapView];
    [self initContainerListView];
    [self initContainerFilterView];
#endif
}

- (void)initMapView
{
    _mapView.x = ZERO_FLOAT;
    _mapView.y = ZERO_FLOAT;
    _mapView.width = self.view.width;
    _mapView.height = self.view.height - _spotsViewController.handlerButton.height;
    // delegate
    _mapView.delegate = self;
    // get user location
    TUISettings *settings = [TUISettings currentSettings];
    // check if autolocation is on
    if ([settings.autolocation boolValue])
    {
        // auto location
        [[TUILocationManager sharedManager] setDelegate:self];
        [[TUILocationManager sharedManager] startGettingUserLocation];
    }
    else
    {
        [self centerMapInLatitude:[settings.latitude doubleValue] longitude:[settings.longitude doubleValue] radius:DISTANCE_1000_M];
        [self updateSpotListForLatitude:[settings.latitude doubleValue] longitude:[settings.longitude doubleValue] radius:DISTANCE_1000_M];
    }
}

- (void)initContainerListView
{
    _containerListView.x = ZERO_FLOAT;
    _containerListView.y = _mapView.height;
    _containerListView.width = self.view.width;
    _containerListView.height = _spotsViewController.handlerButton.height + _spotsViewController.spotListContainerView.height;
}

- (void)initContainerFilterView
{
    _containerFilterView.x = ZERO_FLOAT;
    _containerFilterView.y = -[_filterListViewController numberOfFilters] * [_filterListViewController filterHeight];
    _containerFilterView.width = self.view.width;
    _containerFilterView.height = [_filterListViewController numberOfFilters] * [_filterListViewController filterHeight] + [_filterListViewController handlerButton].height;
    
}


#pragma mark - Shaking -

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self performSegueWithIdentifier:DEVELOPER_SETTINGS_SEGUE sender:self];
    }
}


#pragma mark - Hide/display list -

- (void)hideList
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED
                     animations:^
     {
         typeof(self) __strong strongSelf = weakSelf;
         if (!strongSelf) return;
         
         strongSelf.mapView.height = strongSelf.view.height - strongSelf.spotsViewController.handlerButton.height;
         strongSelf.containerListView.y = strongSelf.mapView.height;
         
     }
                     completion:^(BOOL finished)
     {
         typeof(self) __strong strongSelf = weakSelf;
         if (!strongSelf) return;
         
         if (finished)
         {
             strongSelf.spotsViewController.displayed = NO;
         }
     }];
}

- (void)displayList
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED
                     animations:^
     {
         typeof(self) __strong strongSelf = weakSelf;
         if (!strongSelf) return;
         // hide filters if displayed
         if (_filterListViewController.displayed)
         {
             [strongSelf hideFilters];
         }
         
         strongSelf.mapView.height = strongSelf.view.height - strongSelf.containerListView.height;
         strongSelf.containerListView.y = strongSelf.mapView.height;
     }
                     completion:^(BOOL finished)
    {
        typeof(self) __strong strongSelf = weakSelf;
        if (!strongSelf) return;
        
        if (finished)
        {
            strongSelf.spotsViewController.displayed = YES;
        }
    }];
}

#pragma mark - Hide/display filters -

- (void)hideFilters
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED
                     animations:^
     {
         typeof(self) __strong strongSelf = weakSelf;
         if (!strongSelf) return;
         
         strongSelf.containerFilterView.y = -[_filterListViewController numberOfFilters] * [_filterListViewController filterHeight];
         
     }
                     completion:^(BOOL finished)
     {
         typeof(self) __strong strongSelf = weakSelf;
         if (!strongSelf) return;
         
         if (finished)
         {
             strongSelf.filterListViewController.displayed = NO;
         }
     }];
}

- (void)displayFilters
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:DEFAULT_ANIMATION_SPEED
                     animations:^
     {
         typeof(self) __strong strongSelf = weakSelf;
         if (!strongSelf) return;
         // hide list if displayed
         if (_spotsViewController.displayed)
         {
             UIImage *listUpImage = [UIImage imageNamed:@"ux-list-up.png"];
             [_spotsViewController.handlerButton setImage:listUpImage forState:UIControlStateNormal];
             [strongSelf hideList];
         }
         strongSelf.containerFilterView.y = ZERO_FLOAT;
     }
                     completion:^(BOOL finished)
     {
         typeof(self) __strong strongSelf = weakSelf;
         if (!strongSelf) return;
         
         if (finished)
         {
             strongSelf.filterListViewController.displayed = YES;
         }
     }];
}


#pragma mark - TUISettingsViewController delegate -

- (void)saveButtonPressed
{
    [self dismissViewControllerAnimated:YES completion:^{
        [_filterListViewController updateFilters];
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


#pragma mark - TUILocationManagerDelegate delegate -

- (void)userLocationReady:(TUILocation *)location
{
    [self centerMapInLatitude:[location.latitude doubleValue] longitude:[location.longitude doubleValue] radius:DISTANCE_1000_M];
    [self updateSpotListForLatitude:[location.latitude doubleValue] longitude:[location.longitude doubleValue] radius:DISTANCE_1000_M];
}


#pragma mark - Map -

- (void)centerMapInLatitude:(CLLocationDegrees)latitude
                  longitude:(CLLocationDegrees)longitude
                     radius:(NSInteger)radius
{
    CLLocation *userLocation = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, radius, radius);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:YES];
    self.mapView.showsUserLocation = YES;
}

@end
