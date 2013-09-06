//
//  MantisTableView.h
//  test
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MantisTableView : UITableView <UITableViewDataSource>

// the contents of the UICollectionView
@property (weak, nonatomic) NSArray *data;

//register class for use as a cell
@property (weak, nonatomic) Class cellClass;

@end
