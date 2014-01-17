//
//  TUISearchViewController.h
//  Radar
//
//  Created by Diego Lafuente on 08/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"
#import "MapKit/Mapkit.h"

/**
 The TUISearchViewController is the main controller for search and contains a map, the filters, the list and the basket sticky view.
 */
@interface TUISearchViewController : TUIBaseViewController


@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
