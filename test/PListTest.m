//
//  PListTest.m
//  test
//
//  Created by Mickey Barboi on 9/8/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "PListTest.h"
#import "SampleObject.h"

#import "PreCache.h"

@implementation PListTest {
    NSArray *dataObjects;
}

- (void) test {
    //run the plist testing
    [self createTestObjets];
    
    //[self write];
    //[self read];
}

- (void) createTestObjets {
    SampleObject *s1 = [[SampleObject alloc] init];
    SampleObject *s2 = [[SampleObject alloc] init];
    SampleObject *s3 = [[SampleObject alloc] init];
    
    [s1 setName:@"a"];
    [s1 setNumber:@"1"];
    [s1 setRestaurantID:@"A"];
    
    [s2 setName:@"b"];
    [s2 setNumber:@"2"];
    [s2 setRestaurantID:@"B"];
    
    [s3 setName:@"c"];
    [s3 setNumber:@"2"];
    [s3 setRestaurantID:@"C"];
    
    dataObjects = @[s1, s2, s3];
    
    PreCache *cacher = [[PreCache alloc] init];
    [cacher createPListWithObjects:dataObjects withName:@"test"];
    //[cacher loadPListNamed:@"test"];
}

-(void) write {
    NSLog(@"data pre-save: %@", dataObjects);
    
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    
    NSData *save = [NSKeyedArchiver archivedDataWithRootObject:dataObjects];
    [save writeToFile:path atomically:NO];
    
    
    /*
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *docfilePath = [basePath stringByAppendingPathComponent:@"playerdata.plist"];
    
    [self.data writeToFile:docfilePath atomically:YES];
    self.data = [NSMutableDictionary dictionaryWithContentsOfFile:docfilePath];
    BOOL write = [self.data writeToFile:docfilePath atomically:YES];*/
}

-(void) read {

    /*NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }*/
    
    NSBundle* bundle = [NSBundle mainBundle];
	NSString* plistPath = [bundle pathForResource:@"data" ofType:@"plist"];
    
    
    NSData *save = [[NSData alloc] initWithContentsOfFile:plistPath];
    
    NSArray *data = [NSKeyedUnarchiver unarchiveObjectWithData:save];
    
    NSLog(@"data post-save: %@", data);
    
    /*
    NSString *basePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *docfilePath = [basePath stringByAppendingPathComponent:@"playerdata.plist"];
    [self.data writeToFile:docfilePath atomically:YES];*/
}
@end
