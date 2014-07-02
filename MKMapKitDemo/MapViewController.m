//
//  MapViewController.m
//  MKMapKitDemo
//
//  Created by Lynch on 7/2/14.
//  Copyright (c) 2014 Lynch. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView = _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mapView = [[MKMapView alloc] init];
    _mapView.frame = [UIScreen mainScreen].bounds;
    _mapView.mapType = MKMapTypeStandard;
    _mapView.showsUserLocation = YES;
    [_mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    _mapView.delegate = self;
    
    [self.view addSubview:_mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"123");
    _mapView.centerCoordinate = userLocation.location.coordinate;
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placeMark = [placemarks objectAtIndex:0];
        NSString *country = placeMark.ISOcountryCode;
        NSString *city = placeMark.locality;
        
        NSLog(@"---%@..........%@..cout:%d",country,city,[placemarks count]);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
