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


/**
 The TUISearchMapViewDelegate is in charge of controlling
 the map in the TUISearchViewControler
 */
@interface TUISearchMapViewDelegate : NSObject

/**
 A TUISpotList containing the results to display on the map
 */
@property (nonatomic) TUISpotList *results;

/**
 The mapView to display data on
 */
@property (nonatomic) MKMapView *mapView;

@end
