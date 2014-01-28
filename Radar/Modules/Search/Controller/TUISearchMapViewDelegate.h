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
@class TUIUserLocation;
@protocol TUIMapRegionDelegate;

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
 The region changed block. called when the region of the map changes
 */
@property (nonatomic,copy) void (^regionChangedBlock)(void);

/**
 @methodName reloadData
 @abstract Reload the datasource
 @discussion Reload the datasource and update the
 datasource's mapView to display the current data
 */
- (void)reloadData;

/**
 @methodName userLocationUpdated:
 @abstract Updates the user location in the map
 @discussion This method receives the updated user location and the current
 distance filter and updates the map with it.
 */
- (void)userLocationUpdated:(TUIUserLocation *)location
                     radius:(NSUInteger)radius;

@end

