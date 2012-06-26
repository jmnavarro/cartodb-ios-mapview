//
//  CartoDBPOIGroup.m
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "CartoDBPOIGroup.h"
#import "macros.h"
#import "CartoDBPOI.h"


@implementation CartoDBPOIGroup


- (id) init
{
    if(self = [super init]) {
        _items = [[NSMutableArray alloc] initWithCapacity:16];
        _totalX = 0;
        _totalY = 0;
    }
    return self;
}


- (void) addPOI:(CartoDBPOI*)poi;
{
    MKMapPoint mapPoint = MKMapPointForCoordinate(poi.coordinate);
    _totalX += mapPoint.x;
    _totalY += mapPoint.y;
    
    [_items addObject:poi];
}


- (CartoDBPOI*) poiAtIndex:(int)index
{
    return [_items objectAtIndex:index];
}


- (int) count
{
    return _items.count;
}


- (CLLocationCoordinate2D) centerPoint
{
    return MKCoordinateForMapPoint(MKMapPointMake(_totalX / _items.count, _totalY / _items.count));
}


-(void)dealloc
{
    SAFE_RELEASE(_items);
    [super dealloc];
}

@end
