//
//  MCInterpreterHub.h
//  test
//
//  Created by Mickey Barboi on 9/10/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCProperty.h"

#import "MCBinder.h"

/*
 allows bindings to dive into arbitrarily nested uielemnts for deep keypaths
 
 Why is this here/why was this code moved from the Binder? Because this can be called 
 recursively
 */

@interface MCInterpreterHub : NSObject

- (void) findInterpreterAndBind:(MCProperty *)model toObject:(MCProperty *)property;

@end
