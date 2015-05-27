//
//  MainViewController.m
//  ShowMeTheKitties
//
//  Created by John Green on 26/05/2015.
//  Copyright (c) 2015 AngryYak. All rights reserved.
//

#import "MainViewController.h"
#import "AFNetworking.h"
#import "CatManager.h"
#import "CatCell.h"
#import "CatImage.h"

@interface MainViewController ()

@end

@implementation MainViewController
{
    NSMutableArray *_data; //array of catImage objects
    CatManager *_catManager; //manages cat retrieval
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.clearsSelectionOnViewWillAppear = NO;
 
    _data = [NSMutableArray new];
    _catManager = [CatManager new];
    
    //start getting 'em!
    [self getCats];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    _data = [NSMutableArray new];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count + 1; // plus one to show busy cell
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //show the busy cell if we have reached the end of the current data
    if (indexPath.row >= _data.count) {
        
        [self getCats]; //get some more
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KittySearchCell" forIndexPath:indexPath];
        return cell;
    }
    
    //get cell to display image
    CatCell *cell = [tableView dequeueReusableCellWithIdentifier:[CatCell reuseIdentifier] forIndexPath:indexPath];
    
    //update with cat data
    CatImage *catImage = [_data objectAtIndex:indexPath.row];
    
    [cell updateWithCat:catImage];
    
    return cell;
}


/**
 *  retrieve me some cats please
 */
- (void) getCats {
    
    [_catManager getMoreCats:@20 completionBlock:^(NSArray *catImages) {
        [_data addObjectsFromArray:catImages];
        [self.tableView reloadData];
    }];
    
}

@end
