//
//  TestingCell.m
//  test
//
//  Created by Mickey Barboi on 9/10/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "TestingCell.h"

@implementation TestingCell

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

@end
