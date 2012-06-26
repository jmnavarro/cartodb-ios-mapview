//
//  MKMapView+Cluster.h
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>


@class CartoDBPOICluster;


@interface MKMapView (Cluster)

- (NSArray *) clusterForAnnotations:(NSArray *)annotations;

@end
