//
//  MBCollectionView1.h
//  Culvers
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBCollectionView1 : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegate>

// the contents of the UICollectionView
@property (weak, nonatomic) NSArray *data;

//defines how the collectionview organizes itself
@property (weak, nonatomic) UICollectionViewLayout *layout;

//register class for use as a cell
@property (weak, nonatomic) Class cellClass;

@property (assign, nonatomic) int columns;
@end
