//
//  TUIUserLocationAnnotationView.h
//  Radar
//
//  Created by Diego Lafuente on 24/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import <MapKit/MapKit.h>

/**
 TUIUserLocationAnnotationView is a subclass of MKAnnotationView. Used to show and animate the current user location on a map.
 Has a pulsating animation when created that animates until stopped.
 */
@interface TUIUserLocationAnnotationView : MKAnnotationView

/**
 Stop the pulsating animation.
 */
- (void)stopAnimating;

@end
