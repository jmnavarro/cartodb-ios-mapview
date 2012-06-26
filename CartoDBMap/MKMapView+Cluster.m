//
//  MKMapView+Cluster.m
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MKMapView+Cluster.h"
#import "macros.h"
#import "CartoDBPOICluster.h"
#import "CartoDBPOI.h"


static const int kMinimumClusterLevel = 100000;
static const int kBlocks = 4;



@implementation MKMapView (Cluster)

- (NSArray *) clusterForAnnotations:(NSArray *)annotations
{
    // algorithm based on https://github.com/RVLVR/REVClusterMap
    
    NSMutableArray *visibleAnnotations = [NSMutableArray array];
    
    double tileX     = self.visibleMapRect.origin.x;
    double tileY     = self.visibleMapRect.origin.y;
    float tileWidth  = self.visibleMapRect.size.width / kBlocks;
    float tileHeight = self.visibleMapRect.size.height / kBlocks;
    
    MKMapRect mapRect = MKMapRectWorld;
    NSUInteger maxWidthBlocks = round(mapRect.size.width / tileWidth);
    
    float zoomLevel = maxWidthBlocks / kBlocks;
    
    float tileStartX = floorf(tileX/tileWidth)  * tileWidth;
    float tileStartY = floorf(tileY/tileHeight) * tileHeight;

    MKMapRect visibleMapRect = MKMapRectMake(tileStartX, tileStartY,
tileWidth * (kBlocks+1), tileHeight * (kBlocks+1));
    
    for (id<MKAnnotation> point in annotations) {
        MKMapPoint mapPoint = MKMapPointForCoordinate(point.coordinate);
        if (MKMapRectContainsPoint(visibleMapRect, mapPoint)) {
            if (![self.annotations containsObject:point]) {
                [visibleAnnotations addObject:point];
            }
        }
    }
    
    if (zoomLevel > kMinimumClusterLevel) {
        return visibleAnnotations;
    }
    
    NSMutableArray *clusters = [NSMutableArray array];
    int i = 0;
    int length = (kBlocks+1)*(kBlocks+1);
    while(i++ < length) {
        CartoDBPOICluster *c = [[CartoDBPOICluster alloc] init];
        [clusters addObject:c];
        [c release];  
    }
    
    for (CartoDBPOI *poi in visibleAnnotations) {
        MKMapPoint mapPoint = poi.point;
        
        double localPointX = mapPoint.x - tileStartX;
        double localPointY = mapPoint.y - tileStartY;
        
        int localTileNumberX = floor(localPointX / tileWidth);
        int localTileNumberY = floor(localPointY / tileHeight);
        int localTileNumber = localTileNumberX + (localTileNumberY * (kBlocks+1));
        
        [(CartoDBPOICluster *)[clusters objectAtIndex:localTileNumber] addPOI:poi];
    }
    
    NSMutableArray *newPins = [NSMutableArray array];
    for (CartoDBPOICluster *c in clusters) {
        if ([c count] > 0 && ![self existsCluster:c]) {
            [newPins addObject:[c groupPOI]];
        } 
    }
    
    return newPins;
}



- (bool) existsCluster:(CartoDBPOICluster *)cluster
{
    for (CartoDBPOI *pin in self.annotations) {
        if (pin.class == CartoDBPOI.class && pin.count > 0) {
            if (MKMapPointEqualToPoint(pin.point, [cluster groupPOI].point)) {
                return YES;
            }
        }
    }
    return NO;
}


@end
