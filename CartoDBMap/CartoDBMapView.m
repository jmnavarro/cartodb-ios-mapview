//
//  CartoDBClusterMapView.m
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CartoDBMapView.h"
#import "MKMapView+Cluster.h"



@implementation CartoDBMapView

@synthesize delegate = _delegate;



- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _annotations = nil;    
        _zoom = self.visibleMapRect.size.width * self.visibleMapRect.size.height;
        super.delegate = self;
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _annotations = nil;    
        _zoom = self.visibleMapRect.size.width * self.visibleMapRect.size.height;
        super.delegate = self;
    }
    return self;
}





-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    if ([_delegate respondsToSelector:@selector(mapView:viewForOverlay:)]) {
        return [_delegate mapView:mapView viewForOverlay:overlay];
    }
    return nil;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([_delegate respondsToSelector:@selector(mapView:viewForAnnotation:)]) {
        return [_delegate mapView:mapView viewForAnnotation:annotation];
    } 
    return nil;
}


- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    if ([_delegate respondsToSelector:@selector(mapView:regionWillChangeAnimated:)]) {
        [_delegate mapView:mapView regionWillChangeAnimated:animated];
    } 
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    if ([_delegate respondsToSelector:@selector(mapViewWillStartLoadingMap:)]) {
        [_delegate mapViewWillStartLoadingMap:mapView];
    }
}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    if ([_delegate respondsToSelector:@selector(mapViewDidFinishLoadingMap:)]) {
        [_delegate mapViewDidFinishLoadingMap:mapView];
    }
}
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
    if ([_delegate respondsToSelector:@selector(mapViewDidFailLoadingMap:withError:)]) {
        [_delegate mapViewDidFailLoadingMap:mapView withError:error];
    }
}
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    if ([_delegate respondsToSelector:@selector(mapView:didAddAnnotationViews:)]) {
        [_delegate mapView:mapView didAddAnnotationViews:views];
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    if ([_delegate respondsToSelector:@selector(mapView:annotationView:calloutAccessoryControlTapped:)]) {
        [_delegate mapView:mapView annotationView:view calloutAccessoryControlTapped:control];
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if ([_delegate respondsToSelector:@selector(mapView:didSelectAnnotationView:)]) {
        [_delegate mapView:mapView didSelectAnnotationView:view];
    }
}
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    if ([_delegate respondsToSelector:@selector(mapView:didDeselectAnnotationView:)]) {
        [_delegate mapView:mapView didDeselectAnnotationView:view];
    }
}

- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView
{
    if ([_delegate respondsToSelector:@selector(mapViewWillStartLocatingUser:)]) {
        [_delegate mapViewWillStartLocatingUser:mapView];
    }
}
- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView
{
    if ([_delegate respondsToSelector:@selector(mapViewDidStopLocatingUser:)]) {
        [_delegate mapViewDidStopLocatingUser:mapView];
    }
}
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if ([_delegate respondsToSelector:@selector(mapView:didUpdateUserLocation:)]) {
        [_delegate mapView:mapView didUpdateUserLocation:userLocation];
    }
}
- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    if ([_delegate respondsToSelector:@selector(mapView:didFailToLocateUserWithError:)]) {
        [_delegate mapView:mapView didFailToLocateUserWithError:error];
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState 
   fromOldState:(MKAnnotationViewDragState)oldState
{
    if ([_delegate respondsToSelector:@selector(mapView:annotationView:didChangeDragState:fromOldState:)]) {
        [_delegate mapView:mapView annotationView:view didChangeDragState:newState fromOldState:oldState];
    }
}

- (void)mapView:(MKMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews
{
    if ([_delegate respondsToSelector:@selector(mapView:didAddOverlayViews:)]) {
        [_delegate mapView:mapView didAddOverlayViews:overlayViews];
    }
}


- (void) mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    if ([self mapViewDidZoom]) {
        [super removeAnnotations:self.annotations];
        self.showsUserLocation = self.showsUserLocation;
    }
    
    NSArray *add = [mapView clusterForAnnotations:_annotations];

    [super addAnnotations:add];    
}

- (BOOL) mapViewDidZoom
{
    double newZoom = self.visibleMapRect.size.width * self.visibleMapRect.size.height;
    bool ret = (_zoom != newZoom);

    _zoom = newZoom;
    
    return ret;
}

- (void) addAnnotations:(NSArray *)annotations
{
    [_annotations release];
    _annotations = [annotations copy];
    
    NSArray *add = [self clusterForAnnotations:annotations];
    
    [super addAnnotations:add];
}


- (void)dealloc
{
    [_annotations release];
    [super dealloc];
}


@end
