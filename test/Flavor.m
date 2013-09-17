//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//




#import "Flavor.h"

@implementation Flavor
@synthesize flavorID, name;

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{
	@"flavorId": @"flavorID",
	@"flavorName": @"name", }];

	return mapping;
}

+ (RKResponseDescriptor *) entityMapping {
    //object mapping
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([self class]) inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    
    mapping.identificationAttributes = @[ @"flavorID" ];
    
    
    RKObjectMapping *attrMapping = [self mapping];
    
    [mapping addAttributeMappingsFromDictionary:@{@"flavorId": @"flavorID",
                                                           @"flavorName": @"name", }];
    
    return [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:@"queryflavors.aspx" keyPath:@""                                         statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

/*
#pragma mark NSCoding Protocol
-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:flavorID forKey:@"flavorID"];
	[encoder encodeObject:name forKey:@"name"];
	[encoder encodeObject:description forKey:@"description"];
	[encoder encodeObject:image forKey:@"image"];
    
    if(live)
        [encoder encodeObject:@"1" forKey:@"live"];
    else
        [encoder encodeObject:@"0" forKey:@"live"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
    
	self.flavID = [decoder decodeObjectForKey:@"flavorID"];
	self.name = [decoder decodeObjectForKey:@"name"];
	self.description = [decoder decodeObjectForKey:@"description"];
	self.image = [decoder decodeObjectForKey:@"image"];
    
    if([[decoder decodeObjectForKey:@"live"] isEqualToString:@"1"])
        self.live = YES;
    else
        self.live = NO;
    
	return self;
}*/


@end