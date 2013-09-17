//
//  Culvers
//
//  Created by Mickey Barboi on 8/29/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//


@interface Ingredient : NSObject

@property (strong, nonatomic) NSString * ingredientID;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * calories;
@property (strong, nonatomic) NSString * caloriesFat;
@property (strong, nonatomic) NSString * totalFat;
@property (strong, nonatomic) NSString * satFat;
@property (strong, nonatomic) NSString * transFat;
@property (strong, nonatomic) NSString * carbs;
@property (strong, nonatomic) NSString * protein;
@property (strong, nonatomic) NSString * sugar;
@property (strong, nonatomic) NSString * cholesterol;
@property (strong, nonatomic) NSString * fiber;
@property (strong, nonatomic) NSString * servingSize;
@property (strong, nonatomic) NSString * sodium;

+ (RKObjectMapping *) mapping;

@end