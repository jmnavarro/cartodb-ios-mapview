//
//  CartoDBCluster.h
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@class CartoDBPOIGroup;
@class CartoDBPOI;


@interface CartoDBPOICluster : NSObject {
    CartoDBPOIGroup *_group;
}


@property (nonatomic, readonly) int count;


- (void) addPOI:(CartoDBPOI*)annotation;
- (CartoDBPOI*) poiForIndex:(int)index;
- (CartoDBPOI*) groupPOI;


@end
