//
//  SampleObject.m
//  test
//
//  Created by Mickey Barboi on 9/8/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "SampleObject.h"

@implementation SampleObject

#pragma mark NSCoding Protocol
-(void) encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:_restaurantID forKey:@"restaurantID"];
	[encoder encodeObject:_number forKey:@"number"];
	[encoder encodeObject:_name forKey:@"name"];

}

- (id) initWithCoder:(NSCoder *)decoder {
	self = [super init];
    
	self.restaurantID = [decoder decodeObjectForKey:@"restaurantID"];
	self.number = [decoder decodeObjectForKey:@"number"];
	self.name = [decoder decodeObjectForKey:@"name"];

    
	return self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"<%@ %@ %@>", self.restaurantID, self.name, self.number];
}

@end
