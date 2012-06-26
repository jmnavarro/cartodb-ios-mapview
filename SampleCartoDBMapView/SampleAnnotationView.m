//
//  CartoDBClusterAnnotationView.m
//  ClusterCartoDB
//
//  Created by JM on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleAnnotationView.h"
#import "macros.h"

@implementation SampleAnnotationView

@synthesize coordinate;
@synthesize text;


+ (SampleAnnotationView*) annotation:(id<MKAnnotation>)annotation reusingIdentifier:(NSString *)reuseIdentifier
{
    return [[[SampleAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier] autorelease];
}

- (id) initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 34, 34)];
        _label.textColor = [UIColor whiteColor];
        _label.backgroundColor = [UIColor clearColor];
        _label.font = [UIFont boldSystemFontOfSize:11]; 
        _label.textAlignment = UITextAlignmentCenter;
        _label.shadowColor = [UIColor blackColor];
        _label.shadowOffset = CGSizeMake(0,-1);
        [self addSubview:_label];
    }
    return self;
}

- (void) setText:(NSString *)value
{
    _label.text = value;
}

- (void) dealloc
{
    SAFE_RELEASE(_label);
    [super dealloc];
}

@end
