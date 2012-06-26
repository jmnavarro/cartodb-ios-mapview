//
//  CartoDBClusterMapView.h
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface CartoDBMapView : MKMapView <MKMapViewDelegate>
{
    NSArray *_annotations;
    double _zoom;
}

@property(nonatomic,assign) id<MKMapViewDelegate> delegate;

@end
