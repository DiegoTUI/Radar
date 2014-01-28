//
//  TUISearchMapViewDelegate.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 26/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISearchMapViewDelegate.h"
// Models
#import "TUISpotList.h"
#import "TUIAtlasTicket.h"
#import "TUIFoursquareVenue.h"
#import "TUILocation.h"
// Views
#import "TUIUserLocationAnnotationView.h"
#import "TUISpotAnnotationView.h"

static CGFloat kUserLocationAnnotationWidth = 26;
static CGFloat kUserLocationAnnotationHeight = 26;

@interface TUISearchMapViewDelegate () <MKMapViewDelegate>

@end

@implementation TUISearchMapViewDelegate

#pragma mark - Setters

- (void)setMapView:(MKMapView *)mapView
{
    _mapView = mapView;
    _mapView.showsUserLocation = NO;
    _mapView.delegate = self;
}


#pragma mark - Loading

- (void)reloadData
{
    [self removeAnnotations];
    [self addAnnotations];
}

#pragma mark - Map Annotation

- (void)addAnnotations
{
    for (TUISpot *spot in _spotList.spots)
    {
        [_mapView addAnnotation:spot];
    }
}

- (void)removeAnnotations
{
    //remove all the annotations except the user location
    for (id<MKAnnotation> annotation in _mapView.annotations)
    {
        if (![annotation isKindOfClass:[TUILocation class]])
        {
            [_mapView removeAnnotation:annotation];
        }
    }
}

- (void)removeUserLocationAnnotation
{
    //remove all the annotations except the user location
    for (id<MKAnnotation> annotation in _mapView.annotations)
    {
        if ([annotation isKindOfClass:[TUILocation class]])
        {
            [_mapView removeAnnotation:annotation];
        }
    }
}

- (void)userLocationUpdated:(TUILocation *)location
{
    //remove previous user location
    [self removeUserLocationAnnotation];
    // add the new one
    TUILocation *userLocation = [[TUILocation alloc] init];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [location.latitude doubleValue];
    coordinate.longitude = [location.longitude doubleValue];
    userLocation.coordinate = coordinate;
    
    [_mapView addAnnotation:userLocation];
}


#pragma mark - Annotation View

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *annotationView = nil;
    
    if([annotation isKindOfClass:[TUILocation class]])
    {
        annotationView = [[TUIUserLocationAnnotationView alloc] initWithFrame:CGRectMake(ZERO_FLOAT, ZERO_FLOAT, kUserLocationAnnotationWidth, kUserLocationAnnotationHeight)];
        
    }
    else if ([annotation isKindOfClass:[TUIAtlasTicket class]])
    {
        annotationView = [[TUISpotAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"atlasTicket"];
    }
    else
    {
        annotationView = [[TUISpotAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"foursquareVenue"];
    }
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"Updated user location");
    
    
}

- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"Failed user location with Error: %@", error);
}


@end
