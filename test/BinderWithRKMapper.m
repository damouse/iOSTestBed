//
//  BinderWithRKMapper.m
//  test
//
//  Created by Mickey Barboi on 9/8/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "BinderWithRKMapper.h"
#import "RKMappingOperation.h"

#import "TestDest.h"
#import "TestSource.h"


@implementation BinderWithRKMapper

- (void) test {
    //run the binding tests
    TestSource *source = [[TestSource alloc] init];
    TestDest * dest = [[TestDest alloc] init];
    
    UILabel *labSource = [[UILabel alloc] init];
    UILabel *labDest = [[UILabel alloc] init];
    
    [source setMyAge:@"22"];
    [source setMyName:@"Mickey"];
    [source setMyDate:[NSDate date]];
    
    [labSource setText:@"Mr."];
    [labSource setFont:[UIFont systemFontOfSize:20]];
    
    [source setMyTitle:labSource];
    [dest setTitle:labDest];
    /*
     @interface RKMetadataExample : NSObject
     @property (nonatomic, copy) NSString *name;
     @property (nonatomic, copy) NSURL *URL;
     @property (nonatomic, copy) NSDate *mappedAt;
     @end
     
     RKMetadataExample *example = [RKMetadataExample new];
     NSDictionary *representation = @{ @"name": @"Blake Watters" };
     NSDictionary *metadata = @{ @"URL": [NSURL URLWithString:@"http://restkit.org"] };*/
     
     RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[TestDest class]];
    [objectMapping addAttributeMappingsFromDictionary:@{ @"myName": @"name", @"myAge": @"age", @"myDate" : @"date"}];
     
     RKMappingOperation *mappingOperation = [[RKMappingOperation alloc] initWithSourceObject:source destinationObject:dest mapping:objectMapping];
     //mappingOperation.metadata = metadata;
     
     NSError *error = nil;
     BOOL success = [mappingOperation performMapping:&error];

    NSLog(@"And the winner is...");
}
@end
