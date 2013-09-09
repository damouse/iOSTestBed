//
//  LocationViewController.h
//  test
//
//  Created by Mickey Barboi on 9/6/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface LocationViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapMain;

@end
