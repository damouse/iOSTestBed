//
//  TestCell.h
//  test
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UICollectionViewCell

@property (strong, nonatomic) NSString *reuseIdentifier;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

- (void) fillWithData:(id)data;
@end
