//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//


#import "Ingredient.h"


@implementation Ingredient
@synthesize ingredientID, name, calories, caloriesFat, totalFat, satFat, transFat, carbs, protein, sugar, cholesterol, fiber, servingSize, sodium;

#pragma mark Connection Manager
+ (RKObjectMapping *) mapping {
	//returns the mapping needed by RestKit to perform API calls
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];
	[mapping addAttributeMappingsFromDictionary:@{
	@"": @"ingredientID",
	@"aIngredient": @"name",
	@"calories": @"calories",
	@"calFromFat": @"caloriesFat",
	@"totalFat": @"totalFat",
	@"satFat": @"satFat",
	@"transFat": @"transFat",
	@"carbs": @"carbs",
	@"protein": @"protein",
	@"sugar": @"sugar",
	@"cholesterol": @"cholesterol",
	@"dietFiber": @"fiber",
	@"servingSize": @"servingSize",
	@"sodium": @"sodium"  }];

	return mapping;
}


#pragma mark NSCoding Protocol
-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:ingredientID forKey:@"ingredientID"];
	[encoder encodeObject:name forKey:@"name"];
	[encoder encodeObject:calories forKey:@"calories"];
	[encoder encodeObject:caloriesFat forKey:@"caloriesFat"];
	[encoder encodeObject:totalFat forKey:@"totalFat"];
	[encoder encodeObject:satFat forKey:@"satFat"];
	[encoder encodeObject:transFat forKey:@"transFat"];
	[encoder encodeObject:carbs forKey:@"carbs"];
	[encoder encodeObject:protein forKey:@"protein"];
	[encoder encodeObject:sugar forKey:@"sugar"];
	[encoder encodeObject:cholesterol forKey:@"cholesterol"];
	[encoder encodeObject:fiber forKey:@"fiber"];
	[encoder encodeObject:servingSize forKey:@"servingSize"];
	[encoder encodeObject:sodium forKey:@"sodium"];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
    
	self.ingredientID = [decoder decodeObjectForKey:@"ingredientID"];
	self.name = [decoder decodeObjectForKey:@"name"];
	self.calories = [decoder decodeObjectForKey:@"calories"];
	self.caloriesFat = [decoder decodeObjectForKey:@"caloriesFat"];
	self.totalFat = [decoder decodeObjectForKey:@"totalFat"];
	self.satFat = [decoder decodeObjectForKey:@"satFat"];
	self.transFat = [decoder decodeObjectForKey:@"transFat"];
	self.carbs = [decoder decodeObjectForKey:@"carbs"];
	self.protein = [decoder decodeObjectForKey:@"protein"];
	self.sugar = [decoder decodeObjectForKey:@"sugar"];
	self.cholesterol = [decoder decodeObjectForKey:@"cholesterol"];
	self.fiber = [decoder decodeObjectForKey:@"fiber"];
	self.servingSize = [decoder decodeObjectForKey:@"servingSize"];
	self.sodium = [decoder decodeObjectForKey:@"sodium"];
    
	return self;
}


@end