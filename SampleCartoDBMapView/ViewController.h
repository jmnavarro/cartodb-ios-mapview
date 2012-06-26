//
//  ViewController.h
//  SampleCartoDBMapView
//
//  Created by JM on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
