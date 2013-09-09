//
//  LocationViewController.m
//  test
//
//  Created by Mickey Barboi on 9/6/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController () {
    CLLocationManager *manager;
}

@end

@implementation LocationViewController

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
    
}

- (void) viewDidAppear:(BOOL)animated {
    manager = [[CLLocationManager alloc] init];
    [manager setDelegate:self];
    
    manager.desiredAccuracy = kCLLocationAccuracyKilometer;
    // Set a movement threshold for new events.
    manager.distanceFilter = 1000;
    
    [manager startUpdatingLocation];
    
    [self.mapMain setShowsUserLocation:YES];
    [self.mapMain setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Location Stuffs
- (void) startCheckingLocation {
    if(![self locationServicesEnabled]) {
        NSLog(@"Services not enabled");
        return;
    }
    
    
}

- (BOOL) locationServicesEnabled  {
    //ensure the user has allowed location services
    
    return YES;
}


#pragma mark Map Delegate
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    //NSLog(@"Map updated location");
    /*MKCoordinateRegion mapRegion;
    mapRegion.center = mapView.userLocation.coordinate;
    mapRegion.span = MKCoordinateSpanMake(0.2, 0.2);
    [mapView setRegion:mapRegion animated: YES];*/
}


#pragma mark Location Manager Delegate
// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    
    NSLog(@"moving map");
    MKCoordinateRegion mapRegion;
    mapRegion.center = location.coordinate;
    mapRegion.span = MKCoordinateSpanMake(0.2, 0.2);
    [self.mapMain setRegion:mapRegion animated: YES];
    
    if (abs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
    }
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"ERROR: %@", error);
}
@end
