//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//



@interface Group : NSObject

@property (strong, nonatomic) NSString * menuID;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSArray * items;

@property (strong, nonatomic) NSString * icon;

+ (RKObjectMapping *) mapping;

@end