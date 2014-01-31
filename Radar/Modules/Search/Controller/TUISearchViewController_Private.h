//
//  TUISearchViewController_Private.h
//  Radar
//
//  Created by Diego Lafuente on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISearchViewController.h"
// Views
#import "TUIBasketButton.h"
// Controllers
#import "TUISearchMapViewDelegate.h"
#import "TUISpotsViewController.h"
#import "TUIFilterListViewController.h"

/**
 Extension of TUISearchViewController with some private attributes.
 */
@interface TUISearchViewController ()

/**
 The map view
 */
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

/**
 The map view delegate
 */
@property (strong, nonatomic)  TUISearchMapViewDelegate *mapViewDelegate;

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

/**
 The basket.
 */
@property (nonatomic, strong) TUIBasket *basket;

/**
 The basket button.
 */
@property (nonatomic, strong) TUIBasketButton *basketButton;

@end
