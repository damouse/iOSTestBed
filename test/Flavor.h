//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//


@interface Flavor : NSObject

@property (strong, nonatomic) NSString * flavorID;
@property (strong, nonatomic) NSString * name;
/*@property (strong, nonatomic) NSString * description;
@property (nonatomic) BOOL live;
@property (strong, nonatomic) NSString * image;*/

+ (RKObjectMapping *) mapping;
+ (RKResponseDescriptor *) entityMapping;
@end