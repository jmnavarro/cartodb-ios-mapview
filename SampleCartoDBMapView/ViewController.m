//
//  ViewController.m
//  SampleCartoDBMapView
//
//  Created by JM on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CartoDBPOI.h"
#import "SampleAnnotationView.h"
#import "CartoDBMapView.h"
#import "MKMapView+Utils.h"
#import "macros.h"


static CGPoint kPOIs[] = {
    
    // SA
    (CGPoint){40.964313,-5.664825},
    (CGPoint){40.969951,-5.66946},
    (CGPoint){40.975719,-5.652895},
    (CGPoint){40.973836,-5.658188},
    (CGPoint){40.972933,-5.66002},
    
    // AL
    (CGPoint){41.308825,-5.217304},
    (CGPoint){41.341935,-5.250414},
    
    // VA
    (CGPoint){41.698551,-4.833298},
    (CGPoint){41.63809,-4.756737}
};



@implementation ViewController

@synthesize mapView = _mapView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.delegate = self;

    CLLocationCoordinate2D coordinate = {41.498293, -5.256207};
    self.mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, 1000000, 1000000);
    
    NSMutableArray *pois = [[NSMutableArray alloc] initWithCapacity:16];
    
    for (int i=0; i < ARRAY_LEN(kPOIs); ++i) {
        CGFloat lat = kPOIs[i].x;
        CGFloat lon = kPOIs[i].y;
        
        CartoDBPOI *poi = [[CartoDBPOI alloc] initWithLocation:(CLLocationCoordinate2D){lat, lon}];
        poi.title = [NSString stringWithFormat:@"lat=%f lon=%f", lat, lon];;
        [pois addObject:poi];
        [poi release]; 
    }
    
    [self.mapView addAnnotations:pois];
    
    [pois release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    self.mapView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if (view.class == SampleAnnotationView.class) {
        [mapView centerInCoordinate:((CartoDBPOI*)view.annotation).coordinate animated:YES];    
    }    
}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (annotation.class == MKUserLocation.class) {
		return nil;
	}
    
    CartoDBPOI *poi = (CartoDBPOI*) annotation;
    
    MKAnnotationView *view;
    
    if (poi.count == 0) {
        view = nil;
    } else {
        view = (SampleAnnotationView*) [mapView dequeueReusableAnnotationViewWithIdentifier:@"circle"];
        
        if (!view) {
            view = [SampleAnnotationView annotation:annotation reusingIdentifier:@"circle"];
        }
        
        view.image = [UIImage imageNamed:@"circle.png"];
        view.canShowCallout = NO;
        
        ((SampleAnnotationView*)view).text = [NSString stringWithFormat:@"%i", poi.count];
    }
    
    return view;
}

@end
