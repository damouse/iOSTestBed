//
//  MBCollectionView1.m
//  Culvers
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "MBCollectionView1.h"

@implementation MBCollectionView1
@synthesize cellClass;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


#pragma mark Setup
- (void) initCollection {
    //method is the entry point for all logic in this class
    [self setDataSource:self];
    [self setDelegate:self];
    [self reloadData];
}

- (void) loadCellInformation {
    //load all the layout information and any other info (KVO pairing, class registration, reload the data on the cells)
    //this might be easier for the tableviews since there are much fewer variables to play with here.
    //Things that have to be passed into this class: layout, cell classname, data object
    //use loadDataWith to run all the cell loading, make a protocol forthat ?
    
    /*LineFlowLayout *flowLayout = [[LineFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [flowLayout setItemSize:CGSizeMake(self.frame.size.height, self.frame.size.height)];
    [self setShowsHorizontalScrollIndicator:YES];
    [self setContentSize:CGSizeMake(self.frame.size.height, self.frame.size.height)];
    [self setPagingEnabled:YES];
    
    [self setCollectionViewLayout:flowLayout];
    [self setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"prizes_collection_background"]]];
    [self reloadData];*/
}

- (int) findNumberOfSections {
    //
}

#pragma mark Collection Data Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSInteger c = _columns;
    return  c;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_data count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Setup cell identifier
    NSString *cellIdentifier = [self getReuseIdentifier];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //nil? need method to get data
    [self fillCell:cell withData:nil];
    
    return cell;
    
}

/*- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}*/


#pragma mark Wrappers
- (NSString *) getReuseIdentifier {
    NSAssert([cellClass respondsToSelector:@selector(reuseIdentifier)], @"Collection View Cells must provide their own reuse identifiers");
    
    return [cellClass performSelector:@selector(reuseIdentifier)];
}

- (void) fillCell:(UICollectionViewCell *)cell withData:(id)data {
    NSAssert([cell respondsToSelector:@selector(fillWithData:)], @"Collection View Cells must contain the logic for populating their views given a model object");
    
    [cell performSelector:@selector(fillWithData:) withObject:data];
}


#pragma mark Overridden Synthesis
- (void) setData:(NSArray *)dataNew {
    //trigger the collection view to load and display when the data is set
    _data = dataNew;
    
    [self initCollection];
}
@end
