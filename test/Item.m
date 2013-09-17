//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//


#import "Item.h"
#import "Ingredient.h"



@implementation Item
@synthesize itemID, description, image, name, ingredients, androidEnabled, ecoprintEnabled, iphoneEnabled, allergens;

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{
	@"aIdMenuItem": @"itemID",
	@"aDescription": @"description",
	@"afileName": @"image",
	@"aMenuItem": @"name",
	@"IsAndroidEnabled": @"androidEnabled",
	@"IsEconoprintEnabled": @"ecoprintEnabled",
	@"IsIPhoneEnabled": @"iphoneEnabled",
	@"zAllergenNode": @"allergens"  }];

	RKObjectMapping *ingredientMapping = [Ingredient mapping];
	RKRelationshipMapping *ingredientRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"IngNode" toKeyPath:@"ingredients" withMapping:ingredientMapping];
	[mapping addPropertyMapping:ingredientRelation];

	return mapping;
}


#pragma mark NSCoding Protocol
-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:itemID forKey:@"itemID"];
	[encoder encodeObject:description forKey:@"description"];
	[encoder encodeObject:image forKey:@"image"];
	[encoder encodeObject:name forKey:@"name"];
	[encoder encodeObject:ingredients forKey:@"ingredients"];
	[encoder encodeObject:allergens forKey:@"allergens"];
    
    //comeon... there has to be a better way to do this
    if(androidEnabled)
        [encoder encodeObject:@"1" forKey:@"androidEnabled"];
    else
        [encoder encodeObject:@"0" forKey:@"androidEnabled"];
    
    if(ecoprintEnabled)
        [encoder encodeObject:@"1" forKey:@"ecoprintEnabled"];
    else
        [encoder encodeObject:@"0" forKey:@"ecoprintEnabled"];
    
    if(iphoneEnabled)
        [encoder encodeObject:@"1" forKey:@"iphoneEnabled"];
    else
        [encoder encodeObject:@"0" forKey:@"iphoneEnabled"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	self.itemID = [decoder decodeObjectForKey:@"itemID"];
	self.description = [decoder decodeObjectForKey:@"description"];
	self.image = [decoder decodeObjectForKey:@"image"];
	self.name = [decoder decodeObjectForKey:@"name"];
	self.ingredients = [decoder decodeObjectForKey:@"ingredients"];    
	self.allergens = [decoder decodeObjectForKey:@"allergens"];
    
    if([[decoder decodeObjectForKey:@"androidEnabled"] isEqualToString:@"1"])
        self.androidEnabled = YES;
    else
        self.androidEnabled = NO;
    
    if([[decoder decodeObjectForKey:@"ecoprintEnabled"] isEqualToString:@"1"])
        self.ecoprintEnabled = YES;
    else
        self.ecoprintEnabled = NO;
    
    if([[decoder decodeObjectForKey:@"iphoneEnabled"] isEqualToString:@"1"])
        self.iphoneEnabled = YES;
    else
        self.iphoneEnabled = NO;
    
	return self;
}



@end