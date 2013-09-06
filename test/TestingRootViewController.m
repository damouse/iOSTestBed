//
//  TestingRootViewController.m
//  test
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "TestingRootViewController.h"
#import <objc/runtime.h>
#import "TestTableObject.h"

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
    TestTableObject *obj = [[TestTableObject alloc] init];
    
    [obj setName:@"mickey"];
    [obj setAge:@"10"];
    [obj setTime:@"60"];
    
    NSArray *stuff = [self allPropertyNames:obj];
    
    [stuff enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@, %@", object, [obj valueForKey:object]);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonHuh:(id)sender {
}

- (void) readProperties:(id)object {
    
}

- (NSArray *)allPropertyNames:(id)class
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([class class], &count);
    
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    
    free(properties);
    
    return rv;
}
@end
