//
//  CatCellTests.m
//  ShowMeTheKitties
//
//  Created by John Green on 27/05/2015.
//  Copyright (c) 2015 AngryYak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CatImage.h"
#import "CatCell.h"
#import "MainViewController.h"

@interface CatCellTests : XCTestCase

@end

@implementation CatCellTests
{
    CatCell *_testCell;
}

- (void)setUp {
    [super setUp];
    
    //setup
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    _testCell = [viewController.tableView dequeueReusableCellWithIdentifier:[CatCell reuseIdentifier]];
    
}

- (void) tearDown {
    [super tearDown];
    _testCell = nil;
}

/**
 *  CatCell shows correct image
 */
- (void) testCatCellDisplaysGivenImage {
    
    //setup
    NSString * imageName = @"catImageTest";
    
    CatImage *catImage = [CatImage new];
    catImage.url = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    
    [_testCell updateWithCat:catImage];
    
    //evaluate
    UIImage *compareImage = [UIImage imageNamed:imageName];
    NSData *compareImageData = UIImagePNGRepresentation(compareImage);
    NSData *testImageData = UIImagePNGRepresentation(_testCell.mainImage.image);
    
    XCTAssertEqual(compareImageData, testImageData, @"CatCell not showing correct image");
    
}

@end
