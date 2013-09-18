//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//


#import "Menu.h"
#import "Group.h"


@implementation Menu
@synthesize groups;

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	//[mapping addAttributeMappingsFromDictionary:@{  }];

	RKObjectMapping *groupMapping = [Group mapping];
	RKRelationshipMapping *groupRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"GroupNode" toKeyPath:@"groups" withMapping:groupMapping];
	[mapping addPropertyMapping:groupRelation];

	return mapping;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Menu Groups: %@", groups];
}


#pragma mark NSCoding Protocol
-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:groups forKey:@"groups"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	self.groups = [decoder decodeObjectForKey:@"groups"];
	return self;
}

@end