//
//  TestingTableViewController.m
//  test
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "TestingTableViewController.h"
#import "TestTableObject.h"
#import "TestTableCell.h"

@interface TestingTableViewController () {
    NSArray *data;
}

@end

@implementation TestingTableViewController

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
    TestTableObject *o1 = [[TestTableObject alloc] init];
    TestTableObject *o2 = [[TestTableObject alloc] init];
    TestTableObject *o3 = [[TestTableObject alloc] init];
    TestTableObject *o4 = [[TestTableObject alloc] init];
    TestTableObject *o5 = [[TestTableObject alloc] init];
    
    [o1 setName:@"mickey"];
    [o1 setAge:@"10"];
    [o1 setTime:@"60"];
    
    [o2 setName:@"mickey"];
    [o2 setAge:@"10"];
    [o2 setTime:@"60"];
    
    [o3 setName:@"mickey"];
    [o3 setAge:@"10"];
    [o3 setTime:@"60"];
    
    [o4 setName:@"mickey"];
    [o4 setAge:@"10"];
    [o4 setTime:@"60"];
    
    [o5 setName:@"mickey"];
    [o5 setAge:@"10"];
    [o5 setTime:@"60"];
    
    data = @[o1, o2, o3, o4, o5];
    
    [self.tableviewMain setCellClass:[TestTableCell class]];
    [self.tableviewMain setData:data];
}

@end
