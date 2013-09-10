//
//  MCProperty.m
//  Culvers
//
//  Created by Mickey Barboi on 9/9/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "MCProperty.h"

@implementation MCProperty

- (id) initWithKey:(NSString *)path fromObject:(NSObject *)cell {
    self = [super init];
    
    //assign all fields
    self.originalKeyPath = path;
    self.parentObject = cell;
    
    //depending on if this is a model object or a cell object
    if([cell isKindOfClass:[UITableViewCell class]] || [cell isKindOfClass:[UICollectionViewCell class]]) {
        self.strippedPropertyName = [self parseCellProperty:path];
        self.propertyObject = [cell valueForKey:path];
    }
    else {
        //model property, send to the other parser
    }
    
    return self;
}


#pragma mark String Utils
- (NSString *) parseCellProperty:(NSString *)property {
    //given a key value on this class, remove the type formatting at the front
    NSMutableArray *splitString = [NSMutableArray array];
    
    //split an NSString into an array of words based on camelcase
    NSCharacterSet* lower = [NSCharacterSet lowercaseLetterCharacterSet];
    NSCharacterSet* upper = [NSCharacterSet uppercaseLetterCharacterSet];
    
    int startOfSubstring = 0;
    int i;
    for (i = 0; i < property.length; i++) {
        if (([upper characterIsMember:[property characterAtIndex:i]] && [lower characterIsMember:[property characterAtIndex:i-1]])) {
            NSString *component = [property substringWithRange:NSMakeRange(startOfSubstring, i - startOfSubstring)];
            component = [component lowercaseString];
            
            [splitString addObject:component];
            
            startOfSubstring = i;
        }
    }
    
    //silly little parse bug: this adds the last one.
    [splitString addObject:[[property substringWithRange:NSMakeRange(startOfSubstring, i - startOfSubstring)] lowercaseString]];
    
    NSAssert([splitString count] == 2, @"Properties on cell objects must be named following convention: typeName");
    
    return [splitString objectAtIndex:1];
}
@end
