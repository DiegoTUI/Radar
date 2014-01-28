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
#import "TUIUserLocation.h"
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
        if (![annotation isKindOfClass:[TUIUserLocation class]])
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
        if ([annotation isKindOfClass:[TUIUserLocation class]])
        {
            [_mapView removeAnnotation:annotation];
        }
    }
}

- (void)userLocationUpdated:(TUIUserLocation *)location
                     radius:(NSUInteger)radius
{
    //remove previous user location
    [self removeUserLocationAnnotation];
    [self centerMapInLocation:location radius:radius];
    // add the new one
    [_mapView addAnnotation:location];
}


#pragma mark - Map -

- (void)centerMapInLocation:(TUIUserLocation *)location
                     radius:(NSUInteger)radius
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, radius, radius);
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:YES];
}


#pragma mark - Annotation View

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *annotationView = nil;
    
    if([annotation isKindOfClass:[TUIUserLocation class]])
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
