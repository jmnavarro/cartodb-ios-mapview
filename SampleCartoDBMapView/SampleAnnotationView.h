//
//  CartoDBClusterAnnotationView.h
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface SampleAnnotationView : MKAnnotationView <MKAnnotation> {
    UILabel *_label;
}

+ (SampleAnnotationView*) annotation:(id<MKAnnotation>)annotation reusingIdentifier:(NSString *)reuseIdentifier;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) NSString *text;

@end
