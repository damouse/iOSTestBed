//
//  TestTableCell.m
//  test
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "TestTableCell.h"
#import <objc/runtime.h>

@implementation TestTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *) cellReuseIdentifier {
    return @"cell";
}

#pragma mark Data Binding
- (void) fillWithData:(id)data {    
    //get array of properties
    NSArray *objectProperties = [self getPropertiesForClass:data];
    NSArray *myProperties = [self getPropertiesForClass:self];
    
    //parse array of properties, remove special syntax
    //NSArray *splitMyProperties = [self parseProperties:myProperties];
    //NSArray *splitObjectProperties = [self parseProperties:objectProperties];
    
    //set properties to our properties
    [self bindProperties:objectProperties toProperties:myProperties fromObject:data];
}

- (NSArray *)getPropertiesForClass:(id)class {
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

- (NSArray *) parseProperties:(NSArray *)properties {
    //Returns array where each element is array split by camelcase
    
    NSMutableArray *parsed = [NSMutableArray array];
    
    [properties enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
        NSString *property = (NSString *) object;
        
        NSArray *splitString = [property componentsSeparatedByCharactersInSet: [NSCharacterSet uppercaseLetterCharacterSet]];
        
        [parsed addObject:splitString];
    }];
    
    return parsed;
}

- (void) bindProperties:(NSArray *)objectProperties toProperties:(NSArray *)this fromObject:(id)object{
    //given two 2d arrays, assign the properties (assume name is FIRST for object, SECOND for us
    
    for(int i = 0; i < [objectProperties count]; i++) {
        UILabel *lab = (UILabel *) [self valueForKey:[this objectAtIndex:i]];
        
        [lab setText:[object valueForKey:[objectProperties objectAtIndex:i]]];
        //[self setValue:[object objectAtIndex:i] forKeyPath:[this objectAtIndex:i]];
    }
}
@end
