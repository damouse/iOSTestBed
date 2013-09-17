//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//


#import "Group.h"
#import "Item.h"


@implementation Group
@synthesize menuID, name, items;



#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{
	@"aIdMenuGroup": @"menuID",
	@"aMenuGroup": @"name"  }];

	RKObjectMapping *itemMapping = [Item mapping];
	RKRelationshipMapping *itemRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"MenuItemNode" toKeyPath:@"items" withMapping:itemMapping];
	[mapping addPropertyMapping:itemRelation];

	return mapping;
}


#pragma mark Model Collections
- (void) cellWillBind {
    //called right before the cell binds its fields to the properties on this object, use this to perform any
    //preprocessing that needs to happen
    
    //dummy image placeholder
    [self setIcon:@"dummy_ice_cream.png"];
}


#pragma mark Misc
- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %@", menuID, name];
}


#pragma mark NSCoding Protocol
-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:menuID forKey:@"menuID"];
	[encoder encodeObject:name forKey:@"name"];
	[encoder encodeObject:items forKey:@"items"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	self.menuID = [decoder decodeObjectForKey:@"menuID"];
	self.name = [decoder decodeObjectForKey:@"name"];
	self.items = [decoder decodeObjectForKey:@"items"];
	return self;
}


@end