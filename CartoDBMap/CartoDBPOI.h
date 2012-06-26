//
//  CartoDBPOI.h
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@class CartoDBPOIGroup;


@interface CartoDBPOI : NSObject<MKAnnotation> {
    NSArray *_items;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) MKMapPoint point;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) int count;


+ (CartoDBPOI*) pinWithGroup:(CartoDBPOIGroup*)group;

- (id) initWithLocation:(CLLocationCoordinate2D)loc;

@end
