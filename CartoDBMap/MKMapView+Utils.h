//
//  MKMapView+Utils.h
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (Utils)

- (void) centerInCoordinate:(CLLocationCoordinate2D)center animated:(bool)animated;
- (void) centerForPOIs:(NSArray*)pois animated:(bool)animated;

@end
