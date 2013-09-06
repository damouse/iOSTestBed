//
//  TestTableCell.h
//  test
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableCell : UITableViewCell



@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelAge;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@property (strong, nonatomic) NSString *cellReuseIdentifier;

- (void) fillWithData:(id)data;

@end
