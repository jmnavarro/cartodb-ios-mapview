//
//  CartoDBPOIGroup.h
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@class CartoDBPOI;


@interface CartoDBPOIGroup : NSObject {
    NSMutableArray *_items;
    int _totalX;
    int _totalY;
}

@property (nonatomic, readonly) CLLocationCoordinate2D centerPoint;
@property (nonatomic, readonly) int count;

- (void) addPOI:(CartoDBPOI*)poi;
- (CartoDBPOI*) poiAtIndex:(int)index;

@end
