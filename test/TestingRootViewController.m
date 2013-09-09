//
//  TestingRootViewController.m
//  test
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "TestingRootViewController.h"
#import "PListTest.h"
#import "BinderWithRKMapper.h"

@interface TestingRootViewController ()

@end

@implementation TestingRootViewController

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

}


#pragma mark Location Testing


#pragma mark Buttons
- (IBAction)one:(id)sender {

}

- (IBAction)two:(id)sender {
    //plist testing
    PListTest *test = [[PListTest alloc] init];
    [test test];
}

- (IBAction)three:(id)sender {
    BinderWithRKMapper *binder = [[BinderWithRKMapper alloc] init];
    [binder test];
    
}

- (IBAction)four:(id)sender {
}
@end
