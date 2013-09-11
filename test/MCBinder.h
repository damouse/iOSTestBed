//
//  MCBinder.h
//  test
//
//  Created by Mickey Barboi on 9/2/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

//verbose, conditional BMC logging
#define LOGGING 1

#ifdef LOGGING
#   define MCLog(fmt, ...) NSLog((@"%s [Line %d]\n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define MCLog(...)
#endif


@interface MCBinder : NSObject

/*
 This method is called for every single cell managed by a Bound Model Collection. 
 It is responsible for all of the binding between properties on the objects, cells have
 no idea what is happening other than calling this method and informing the model object
 that a binding has/will occur.
 
 NOTE: this method will turn property names into keypaths, where applicable, by using underscores
 to deliniate the key of a property (indefinately nested)
 */
- (void) bindPropertiesFrom:(NSObject *)model toObject:(NSObject *)cell;

@end
