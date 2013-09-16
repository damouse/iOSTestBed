//
//  MCInterpreterHub.m
//  test
//
//  Created by Mickey Barboi on 9/10/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "MCInterpreterHub.h"
#import "MCProperty.h"

#import "MCUIElementInterpreter.h"
#import "MCLabelInterpreter.h"
#import "MCTextFieldInterpreter.h"
#import "MCTextViewInterpreter.h"
#import "MCImageViewInterpreter.h"
#import "MCButtonInterpreter.h"

@implementation MCInterpreterHub

- (void) findInterpreterAndBind:(MCProperty *)model toObject:(MCProperty *)receiver {
    
    //this is the superclass of all the interperetrs.
    MCUIElementInterpreter *interpreter = nil;
    
    //BRANCH: this is where the property logic happens: this chunk decides what type
    //the receiver is and passes off binding to the appropriate
    //check the type of the reciever object, assign the appropriate interpreter
    if([[receiver propertyObject] isKindOfClass:[UILabel class]])
        interpreter = [[MCLabelInterpreter alloc] init];
    
    if([[receiver propertyObject] isKindOfClass:[UITextView class]])
        interpreter = [[MCTextViewInterpreter alloc] init];
    
    if([[receiver propertyObject] isKindOfClass:[UITextField class]])
        interpreter = [[MCTextFieldInterpreter alloc] init];
    
    if([[receiver propertyObject] isKindOfClass:[UIButton class]])
        interpreter = [[MCButtonInterpreter alloc] init];
    
    if([[receiver propertyObject] isKindOfClass:[UIImageView class]])
        interpreter = [[MCImageViewInterpreter alloc] init];
    
    
    //interpreter has been assigned, hand off execution to it
    NSAssert(interpreter != nil, @"The object type handler has fallen through; no interpreter was asssigned to deal with property %@", model);
    if(![interpreter bindProperty:model toProperty:receiver]) {
        NSLog(@"WARN: interpreter %@ was unable to bind %@ model property to %@ cell property. Check to make sure the desired conversion has been implemented", interpreter, [model propertyObject], [receiver propertyObject]);
    }
    else
        MCLog(@"Bound %@ to %@", [model keyPath], [receiver keyPath]);
    
}
@end
