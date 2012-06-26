//
//  MKMapView+Utils.m
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MKMapView+Utils.h"


@implementation MKMapView (Utils)

- (void) centerInCoordinate:(CLLocationCoordinate2D)center animated:(bool)animated
{
    MKCoordinateSpan span = MKCoordinateSpanMake(self.region.span.latitudeDelta/2.0, self.region.span.longitudeDelta/2.0);
    [self setRegion:MKCoordinateRegionMake(center, span) animated:animated];
}

@end
