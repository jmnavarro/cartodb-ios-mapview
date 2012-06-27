//
//  ViewController.h
//  SampleCartoDBMapView
//
//  Created by JM on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CartoDBMapView.h"



@interface ViewController : UIViewController<CartoDBMapViewDelegate>

@property (nonatomic, retain) IBOutlet CartoDBMapView *mapView;
@property (nonatomic, retain) IBOutlet UITextField *sql;

@end
