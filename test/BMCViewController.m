//
//  BMCViewController.m
//  test
//
//  Created by Mickey Barboi on 9/10/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

/*
 NOTE: this is the working version of BCM v0.0.2
 See viewdidAppear for an example on usage
 */

#import "BMCViewController.h"

#import "Cell.h"
#import "Model.h"
#import "MCBinder.h"

@interface BMCViewController () {
    NSArray *data;
}

@end

@implementation BMCViewController

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
    Model *m1 = [[Model alloc] init];
    Model *m2 = [[Model alloc] init];
    Model *m3 = [[Model alloc] init];
    
    UIColor *backgroundColor = [UIColor colorWithRed:0.5f green:1.0f blue:0.0f alpha:1];
    
    //sample data
    [m1 setName:@"Mickey"];
    [m1 setMyAge:@"22"];
    [m1 setIcon:@"4"];
    [m1 setName_backgroundColor:backgroundColor];
    [m2 setName:@"Tom"];
    [m2 setMyAge:@"21"];
    [m2 setIcon:@"5"];
    [m3 setName:@"Aaron"];
    [m3 setMyAge:@"23"];
    [m3 setIcon:@"6"];
    
    data = @[m1, m2, m3];

    
    [self.tableMain setReuseIdentifier:@"cell"];
    [self.tableMain setData:data];
}

@end
