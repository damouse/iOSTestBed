//
//  MCBinder.m
//  test
//
//  Created by Mickey Barboi on 9/2/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "MCBinder.h"
#import "MCProperty.h"
#import <objc/runtime.h>

@implementation MCBinder {
    NSMutableArray *modelProperties;
}

- (void) bindPropertiesFrom:(NSObject *)model toObject:(NSObject *)cell {
    //set properties to our properties
    NSArray *cellProperties = [self getPropertiesForClass:[cell class]];
    NSArray *modelPropertyStrings = [self getPropertiesForClass:[model class]];
    
    NSMutableArray *properties = [NSMutableArray array];
    modelProperties = [NSMutableArray array];
    
    //create the property wrapper objects from the strings
    for(NSString *prop in cellProperties) {
        MCProperty *wrapper = [[MCProperty alloc] initWithKey:prop fromObject:cell];
        [properties addObject:wrapper];
    }
    
    //create the property wrappe objects for the model's properties
    for(NSString *prop in modelPropertyStrings) {
        MCProperty *wrapper = [[MCProperty alloc] initWithKey:prop fromObject:model];
        [modelProperties addObject:wrapper];
    }
    
    for(MCProperty *property in cellProperties) {
        [self bindProperty:property];
    }
}

- (void) bindProperty:(MCProperty *)property {
    //note: the property wrapper being passed in is one created from the cell object
    //the model's properties are floating around as instance variables because multiple
    //model properties can match to one cell property
    
    //find the matching model properties for this cell property
    NSArray *model = [self getPropertiesMatchingKey:property];
    
    //determine the type of the cell property, create the correct handler and pass it off (for each model property)
    for(MCProperty *modelProperty in model) {
        //determine type of property the cell object has and pass off both properties to a handler
       //if([[property propertyObject] isKindOfClass:[UILabel class]])
            
    }
}

- (void) bindProperty:(NSString *)property fromObject:(NSObject *)model toObject:(NSObject *)cell {
    //given a keypath from a model object (just the name or the name and an "extension")
    //set the appropriate data in the cell property
    NSArray *modelProperties = [self getPropertiesForClass:[model class]];
    
    //properties on cell objects have nice formatting: remove that for the search
    NSString *rawName;// = [self parseCellProperty:property];
    
    //get all the properties from the model that match the property keypath that was passed in
    //NOTE: 2D array incoming to account for keypaths and not just key values
    NSArray *matchingProperties;// = [self getPropertiesFromArray:modelProperties matchingKeyPath:rawName];
    
    //check to make sure the property actually exists on the model
    if([matchingProperties count] == 0) {
        NSLog(@"VEIL: no matching properties found on object %@ for key path %@", [model class], rawName);
        return;
    }
    
    NSObject *propertyObject = [cell valueForKey:property];
    
    //determine the type of property we have, pass the information off to the appropriate handler
    [matchingProperties enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        NSArray *path = (NSArray *)object;
        
        //exclude keypaths on the first iteration of this framework
        if([path count] > 1)
            NSLog(@"VEIL: path passed in as a walk: currently not supported");
        
        //TEMPORARY PATCH: will not work with keypaths
        NSObject *datum = [model valueForKey:[path objectAtIndex:0]];
        
        if([propertyObject isKindOfClass:[UILabel class]])
            [self fillLabel:propertyObject with:datum];
        
        else if([propertyObject isKindOfClass:[UITextView class]])
            [self fillTextView:propertyObject with:datum];
        
        else if([propertyObject isKindOfClass:[UIImageView class]])
            [self fillImage:propertyObject with:datum];
        
        //fallthrough for unsupported keypaths
        else
            NSLog(@"VEIL: unable to determine type of property named %@ for cell %@", property, [self class]);
    }];
}


#pragma mark UIElement Handlers
- (void) fillLabel:(NSObject *)property with:(NSObject *)data {
    UILabel *label = (UILabel *)property;
    
    if([data isKindOfClass:[UILabel class]]) {
        label = (UILabel *)data;
    }
    else if ([data isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *) data;
        
        [label setText:str];
    }
    else {
        NSAssert(false, @"Lables must recieve either a string or an label. View recieved a %@", [data class]);
    }
}

- (void) fillTextView:(NSObject *)property with:(NSObject *)data {
    UITextView *textview = (UITextView *)property;
    
    if([data isKindOfClass:[UITextView class]]) {
        textview = (UITextView *)data;
    }
    else if ([data isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *) data;
        
        [textview setText:str];
    }
    else {
        NSAssert(false, @"Lables must recieve either a string or a textview. View recieved a %@", [data class]);
    }
}

- (void) fillImage:(NSObject *)property with:(NSObject *)data {
    UIImageView *image = (UIImageView *)property;
    
    //figure out what we just recieved, react accordingly
    if([data isKindOfClass:[UIImageView class]]){
        image = (UIImageView *)data;
    }
    else if([data isKindOfClass:[UIImage class]]){
        UIImage *img = (UIImage *)data;
        [image setImage:img];
    }
    else if ([data isKindOfClass:[NSString class]]){
        NSString *img = (NSString *)data;
        [image setImage:[UIImage imageNamed:img]];
        
        if(image.image == nil) {
            NSAssert(false, @"ImageView could not assign image named %@, image was not found", img);
        }
    }
    else {
        NSAssert(false, @"ImageViews must recieve either a string or an image. View recieved a %@", [data class]);
    }
}


#pragma mark Property Utilities
- (NSArray *) getPropertiesForClass:(id)class {
    //returns a list of the properties of the given class as an array of strings
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([class class], &count);
    
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    
    free(properties);
    
    return rv;
}

- (NSArray *) getPropertiesMatchingKey:(MCProperty *)property {
    //Returns array of property paths in the model object that match the passed in keypath
    //note that underscores in the model object's properties are treated as delimeters
    //signifying a key-path walk and not a key value
    
    NSMutableArray *parsed = [NSMutableArray array];
    
    //these are model property wrappers
    for(MCProperty *modelProperty in modelProperties) {

        if([[modelProperty strippedPropertyName] isEqualToString:[property strippedPropertyName]])
            [parsed addObject:modelProperty];
    }
    
    return parsed;
}


@end
