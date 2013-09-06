//
//  MantisTableView.m
//  test
//
//  Created by Mickey Barboi on 8/30/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "MantisTableView.h"

@implementation MantisTableView
@synthesize data, cellClass;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) initCollection {
    //set up the tableview
    [self setDataSource:self];
    [self reloadData];
}


#pragma  mark Data and Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = [self getReuseIdentifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [self fillCell:cell withData:[data objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


#pragma mark Wrappers
- (NSString *) getReuseIdentifier {
    NSAssert([cellClass respondsToSelector:@selector(cellReuseIdentifier)], @"Collection View Cells must provide their own reuse identifiers");
    
    return [cellClass performSelector:@selector(cellReuseIdentifier)];
}

- (void) fillCell:(UITableViewCell *)cell withData:(id)info {
    NSAssert([cell respondsToSelector:@selector(fillWithData:)], @"Collection View Cells must contain the logic for populating their views given a model object");
    
    [cell performSelector:@selector(fillWithData:) withObject:info];
}

#pragma mark Overridden Synthesis
- (void) setData:(NSArray *)dataNew {
    //trigger the collection view to load and display when the data is set
    data = dataNew;
    
    [self initCollection];
}
@end
