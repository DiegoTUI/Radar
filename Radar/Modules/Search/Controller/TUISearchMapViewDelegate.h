//
//  TUISearchMapViewDelegate.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 26/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import <MapKit/MapKit.h>
// Forward declarations
@class TUISpotList;
@class TUILocation;

/**
 The TUISearchMapViewDelegate is in charge of controlling
 the map in the TUISearchViewControler
 */
@interface TUISearchMapViewDelegate : NSObject

/**
 A TUISpotList containing the results to display on the map
 */
@property (strong, nonatomic) TUISpotList *spotList;

/**
 The mapView to display data on
 */
@property (strong, nonatomic) MKMapView *mapView;

/**
 @abstract Reload the datasource
 @discussion Reload the datasource and update the
 datasource's mapView to display the current data
 */
- (void)reloadData;

- (void)userLocationUpdated:(TUILocation *)location;

@end
