//
//  CartoDBCluster.m
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CartoDBPOICluster.h"
#import "CartoDBPOIGroup.h"
#import "CartoDBPOI.h"
#import "macros.h"


@implementation CartoDBPOICluster


- (void) addPOI:(CartoDBPOI*)annotation
{
    if (!_group) {
        _group = [[CartoDBPOIGroup alloc] init];
    }
    
    [_group addPOI:annotation];
}


- (CartoDBPOI*) poiForIndex:(int)index
{
    return [_group poiAtIndex:index];
}

- (CartoDBPOI*) groupPOI
{
    if (self.count <= 0) {
        return nil;
    }
    
    return (self.count == 1) ? [self poiForIndex:0] : [CartoDBPOI pinWithGroup:_group];
}

- (int) count
{
    return _group.count;
}

- (void) dealloc
{
    SAFE_RELEASE(_group);
    [super dealloc];
}

@end
