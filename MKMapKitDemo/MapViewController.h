//
//  MapViewController.h
//  MKMapKitDemo
//
//  Created by Lynch on 7/2/14.
//  Copyright (c) 2014 Lynch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@end
