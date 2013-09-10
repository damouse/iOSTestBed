//
//  MCTableView.h
//  test
//
//  Created by Mickey Barboi on 9/2/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import <UIKit/UIKit.h>


//callback blocks for talbleview delegate
//assign this to the tableview if you need touch callbacks
typedef void (^MCDidSelectTableCell)(NSObject *modelObject, UITableViewCell *cell);


@interface MCTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

// the contents of the UICollectionView
@property (weak, nonatomic) NSArray *data;

@property (weak, nonatomic) NSString *reuseIdentifier;

//DELEGATE CALLBACKS
//didselectcellatindexpath
@property (weak, nonatomic) MCDidSelectTableCell selectHandler;
@end
