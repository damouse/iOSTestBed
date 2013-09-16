//
//  PreCache.m
//  test
//
//  Created by Mickey Barboi on 9/12/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "PreCache.h"

@implementation PreCache

- (void) createPListWithObjects:(NSArray *)data withName:(NSString *)name {
    NSLog(@"PRECACHER: Saving objects");
    NSError *error;
    
    NSString *fname = [NSString stringWithFormat:@"%@.plist", name];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:fname];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    
    NSLog(@"PRECACHER: %@.plist was saved at directory: %@ \nCopy this file into the project for later use.", name, path);
    
    NSData *save = [NSKeyedArchiver archivedDataWithRootObject:data];
    [save writeToFile:path atomically:NO];
}

- (NSArray *) loadPListNamed:(NSString *)name {
    NSLog(@"PRECACHER: Saving objects");
    NSBundle* bundle = [NSBundle mainBundle];
	NSString* plistPath = [bundle pathForResource:name ofType:@"plist"];
    
    
    NSData *save = [[NSData alloc] initWithContentsOfFile:plistPath];
    NSArray *data = [NSKeyedUnarchiver unarchiveObjectWithData:save];
    
    return data;
    //NSLog(@"data post-save: %@", data);
}

@end
