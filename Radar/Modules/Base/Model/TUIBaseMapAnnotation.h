//
//  TUIBaseMapAnnotation.h
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import <Foundation/Foundation.h>

// Frameworks
#import <MapKit/MapKit.h>

/**
 TUIBaseMapAnnotation represents an annotation to be displaed on a MKMapView
 */
@interface TUIBaseMapAnnotation : NSObject <MKAnnotation>

/**
 The annotations coordinate
 */
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

/**
 The annotations title
 */
@property (nonatomic, copy) NSString *title;

/**
 The annotations subtitle
 */
@property (nonatomic, copy) NSString *subtitle;

/**
 @methodName initWithCoordinate
 @abstract Create a new map annotation with a predefined coordinate
 @discussion This method will create a new object conforming to the MKAnnoation protocol with a pre-defined cordinate location
 
 @param coordinate The annotations coordinate
 
 @return A new annotation instance
 */
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;


/**
 @discussion This method will update the coordinate location
 @param coordinate The annotations updated coordinate
 */
- (void)updateCoordinate:(CLLocationCoordinate2D)coordinate;

@end
