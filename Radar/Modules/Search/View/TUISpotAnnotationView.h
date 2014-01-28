//
//  TUISpotAnnotationView.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 26/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import <MapKit/MapKit.h>

/**
 A map annotation view for displaying a spot,
 displays the right icon for the spot.
 */
@interface TUISpotAnnotationView : MKAnnotationView

/**
 Start the pulsating animation.
 */
- (void)startPulsating;
- (void)startJiggling;

/**
 Stop the pulsating animation.
 */
- (void)stopPulsating;
- (void)stopJiggling;

@end
