//
//  CartoDBMapView.h
//  CartoDBMapView
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "CartoDBClient.h"


@class CartoDBMapView;


@protocol CartoDBMapViewDelegate <MKMapViewDelegate>

- (bool) mapView:(CartoDBMapView*)mapView receivedPOIs:(NSMutableArray*)poiList;
- (void) mapView:(CartoDBMapView*)mapView failedRequestWithError:(NSError*)err;

@end



@interface CartoDBMapView : MKMapView <MKMapViewDelegate, CartoDBClientDelegate>
{
    NSArray *_annotations;
    double _zoom;
}

@property (nonatomic, assign) id<CartoDBMapViewDelegate> delegate;
@property (nonatomic, retain) CartoDBCredentials *credentials;

- (bool) startRequestWithSQL:(NSString*)sql;

@end
