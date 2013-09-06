//
//  TestCell.m
//  test
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell {
    NSDictionary *mapping;
}

@synthesize label1, label2, label3;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void) fillWithData:(id)data {
    
    
    [label1 setText:@""];
}
@end
