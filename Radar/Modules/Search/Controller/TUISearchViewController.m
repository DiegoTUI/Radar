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
#import "TUISearchViewController_Private.h"
#import "TUISearchViewController+Basket.h"
// Models
#import "TUILocationManager.h"
#import "TUISettings.h"
#import "TUISpotList+Proxy.h"
#import "TUIAtlasTicket.h"
// Controllers
#import "TUISettingsViewController.h"
// Views
#import "TUIUserLocationAnnotationView.h"
#import "TUISpotAnnotationView.h"


@interface TUISearchViewController () <TUISettingsViewControllerDelegate, TUISpotsViewControllerDelegate, TUIFilterListViewControllerDelegate, TUILocationManagerDelegate>

@end

@implementation TUISearchViewController


#pragma mark - Data

- (void)initData
{
    [super initData];
    
    [self initViewControllers];
    [self initBasket];
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
    // cancel all previous requests
    [TUISpotList cancelNetworkRequests];
    
    typeof(self) __weak weakSelf = self;
    [TUISpotList spotsForLatitude:latitude longitude:longitude radius:radius completion:^(TUISpotList *spotList) {
        typeof(self) __strong strongSelf = weakSelf;
        if (!strongSelf) return;
        
        strongSelf.spotList = spotList;
        [strongSelf reloadMapAndList];
        
    } failure:^(NSError *error) {
        // TODO: handle errors
    }];
}

- (void)reloadMapAndList
{
    [_spotsViewController reloadSpotsWithSpotList:[self filteredSpotList]];
    _mapViewDelegate.spotList = [self filteredSpotList];
    [_mapViewDelegate reloadData];
}

- (TUISpotList *)filteredSpotList
{
    TUISpotList * result = [[TUISpotList alloc] init];
    // get the spots from the given list
    NSMutableOrderedSet *filteredOrderedSet = [_spotList.spots mutableCopy];
    // apply the filters
    for (TUISpot *spot in _spotList.spots)
    {
        if ([spot isKindOfClass:[TUIAtlasTicket class]] &&
            ![(TUIAtlasTicket *)spot compliesWithWeatherFilter:_filterListViewController.activeWeatherFilter timeFilter:_filterListViewController.activeTimeFilter])
        {
            [filteredOrderedSet removeObject:spot];
        }
    }
    // assign the spots and return
    result.spots = filteredOrderedSet;
    return result;
}


#pragma mark - User interface

- (void)initUserInterface
{
    [super initUserInterface];
#ifndef TESTING
    [self initNavigationTitle];
    [self initMapView];
    [self initContainerListView];
    [self initContainerFilterView];
    [self initBasketButton];
#endif
}

- (void)initNavigationTitle
{
    self.navigationItem.title = NSLocalizedString(@"SEARCH_TITLE", nil);
}

- (void)initMapView
{
    _mapView.x = ZERO_FLOAT;
    _mapView.y = ZERO_FLOAT;
    _mapView.width = self.view.width;
    _mapView.height = self.view.height - _spotsViewController.handlerButton.height;
    // delegate
    _mapViewDelegate = [[TUISearchMapViewDelegate alloc] init];
    _mapViewDelegate.mapView = _mapView;
    // region changed block
    typeof(self) __weak weakSelf = self;
    _mapViewDelegate.regionChangedBlock = ^
    {
        typeof(self) strongSelf = weakSelf;
        if ( !strongSelf ) { return ;}
        //update list if region changed.
        MKMapRect mapRect = strongSelf.mapViewDelegate.mapView.visibleMapRect;
        MKMapPoint northMapPoint = MKMapPointMake(MKMapRectGetMidX(mapRect), MKMapRectGetMinY(mapRect));
        MKMapPoint southMapPoint = MKMapPointMake(MKMapRectGetMidX(mapRect), MKMapRectGetMaxY(mapRect));
        NSUInteger radius = MKMetersBetweenMapPoints(northMapPoint, southMapPoint)/TWO_FLOAT;
        
        [strongSelf updateSpotListForLatitude:strongSelf.mapViewDelegate.mapView.centerCoordinate.latitude
                                    longitude:strongSelf.mapViewDelegate.mapView.centerCoordinate.longitude
                                       radius:radius];
    };
    // annotation selected block
    _mapViewDelegate.annotationSelectedBlock = ^(TUISpot *spot)
    {
        typeof(self) strongSelf = weakSelf;
        if ( !strongSelf ) { return ;}
        // find the row of the selected spot in the current list
        TUISpotList *currentSpotList = [strongSelf.spotsViewController currentSpotList];
        NSInteger row = [currentSpotList.spots indexOfObject:spot];
        // return if not found
        if (row == NSNotFound) return;
        __block NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:ZERO_INT];
        // scroll to the selected row
        [strongSelf.spotsViewController scrollTableToRowAtIndexPath:indexPath];
        // display the list and select the row otherwise
        [strongSelf displayListCompletion:^(BOOL finished) {
            typeof(self) strongSelf = weakSelf;
            if ( !strongSelf ) { return ;}
            if (finished)
            {
                [strongSelf.spotsViewController selectRowAtIndexPath:indexPath];
            }
        }];
    };
    // annotation deselected block
    _mapViewDelegate.annotationDeselectedBlock = ^(TUISpot *spot)
    {
        typeof(self) strongSelf = weakSelf;
        if ( !strongSelf ) { return ;}
        [strongSelf.spotsViewController deselectAllRows];
    };
    // get user location
    [[TUILocationManager sharedManager] setDelegate:self];
    [[TUILocationManager sharedManager] startGettingUserLocation];
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

- (void)hideListCompletion:(void (^)(BOOL))completion
{
    // deselect all rows in the table
    [_spotsViewController deselectAllRows];
    
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
             if (completion)
             {
                 completion (finished);
             }
         }
     }];
}

- (void)displayListCompletion:(void (^)(BOOL))completion
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
            if (completion)
            {
                completion (finished);
            }
        }
    }];
}


#pragma mark - Row selected/deselected -

- (void)rowSelected:(NSInteger)row
{
    // Get the spot list displayed in the list
    TUISpotList *spotList = [_spotsViewController currentSpotList];
    // Center map in selected annotation
    MKCoordinateSpan currentSpan = _mapViewDelegate.mapView.region.span;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMake(((TUISpot *)spotList.spots[row]).coordinate, currentSpan);
    MKCoordinateRegion adjustedRegion = [_mapViewDelegate.mapView regionThatFits:viewRegion];
    [_mapViewDelegate.mapView setRegion:adjustedRegion animated:YES];
    // Make annotation jiggle
    TUISpotAnnotationView *selectedAnnotationView = (TUISpotAnnotationView *)[_mapViewDelegate.mapView viewForAnnotation:spotList.spots[row]];
    [selectedAnnotationView startJiggling];
}

- (void)rowDeselected:(NSInteger)row
{
    // Get the spot list displayed in the list
    TUISpotList *spotList = [_spotsViewController currentSpotList];
    TUISpotAnnotationView *selectedAnnotationView = (TUISpotAnnotationView *)[_mapViewDelegate.mapView viewForAnnotation:spotList.spots[row]];
    [selectedAnnotationView stopJiggling];
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
             // reload with new filters
             [strongSelf reloadMapAndList];
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
             [strongSelf hideListCompletion:nil];
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
    typeof(self) __weak weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        typeof(self) __strong strongSelf = weakSelf;
        if (!strongSelf) return;
        
        [strongSelf.filterListViewController updateFilters];
        [strongSelf reloadMapAndList];
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

- (void)userLocationReady:(TUIUserLocation *)location
{
    [self updateSpotListForLatitude:location.coordinate.latitude longitude:location.coordinate.longitude radius:_filterListViewController.activeDistanceFilter];
    [_mapViewDelegate userLocationUpdated:location radius:_filterListViewController.activeDistanceFilter];
}

@end
