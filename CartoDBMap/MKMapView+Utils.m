//
//  MKMapView+Utils.m
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MKMapView+Utils.h"
#import "CartoDBPOI.h"


@implementation MKMapView (Utils)

- (void) centerInCoordinate:(CLLocationCoordinate2D)center animated:(bool)animated
{
    MKCoordinateSpan span = MKCoordinateSpanMake(self.region.span.latitudeDelta/2.0, self.region.span.longitudeDelta/2.0);
    [self setRegion:MKCoordinateRegionMake(center, span) animated:animated];
}

- (void) centerForPOIs:(NSArray*)pois animated:(bool)animated
{
    double totalX = 0;
    double totalY = 0;
    
    for (CartoDBPOI* p in pois) {
        MKMapPoint mapPoint = MKMapPointForCoordinate(p.coordinate);
        totalX += mapPoint.x;
        totalY += mapPoint.y;
    }
    
    CLLocationCoordinate2D center = MKCoordinateForMapPoint(MKMapPointMake(totalX / pois.count, totalY / pois.count));
    
    [self centerInCoordinate:center animated:animated];
}

@end
