//
//  CartoDBPOI.m
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CartoDBPOI.h"
#import "CartoDBPOIGroup.h"

@implementation CartoDBPOI


@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize coordinate = _coordinate;
@synthesize point = _point;


+ (CartoDBPOI*) pinWithGroup:(CartoDBPOIGroup*)group
{
    CartoDBPOI* ret = [[[CartoDBPOI alloc] init] autorelease];
    
    NSMutableArray *ma = [[NSMutableArray alloc] initWithCapacity:group.count];
    for (int i = 0; i < group.count; ++i) {
        [ma addObject:[group poiAtIndex:i]];
    }
    ret->_items = [[NSArray alloc] initWithArray:ma];
    ret.coordinate = group.centerPoint;
    
    return ret;
}

- (id) initWithLocation:(CLLocationCoordinate2D)loc
{
    if (self = [super init]) {
        self.coordinate = loc;
    }
    return self;
}


- (int) count
{
    return _items.count;
}

- (void) setPoint:(MKMapPoint)value;
{
    _point = value;
    _coordinate = MKCoordinateForMapPoint(value);
}

- (void) setCoordinate:(CLLocationCoordinate2D)value
{
    _point = MKMapPointForCoordinate(value);
    _coordinate = value;
}

- (void)dealloc
{
    [_items release];
    [_title release];
    [_subtitle release];
    [super dealloc];
}

@end
