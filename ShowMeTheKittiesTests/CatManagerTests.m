//
//  CatManagerTests.m
//  ShowMeTheKitties
//
//  Created by John Green on 27/05/2015.
//  Copyright (c) 2015 AngryYak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CatManager.h"

@interface CatManagerTests : XCTestCase

@end

@implementation CatManagerTests

/**
 *  GetMoreCats handles nil
 */
- (void) testCatManagerNilResultsRequested {
    
    CatManager *catManager = [CatManager new];
    
    [catManager getMoreCats:nil completionBlock:^(NSArray *catImages) {
        XCTAssertNil(catImages, @"Array of catImages must be nil when numberOfCats is nil");
    }];
    
}

/**
 *  GetMoreCats handles zero
 */
- (void) testCatManagerZeroResultsRequested {
    
    CatManager *catManager = [CatManager new];
    
    [catManager getMoreCats:@0 completionBlock:^(NSArray *catImages) {
        XCTAssertNil(catImages, @"Array of catImages must be nil when numberOfCats is zero");
    }];
    
}

/**
 *  GetMoreCats handles specifed result count
 */
- (void) testCatManagerGetsOneHundredResult {
    
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"results returned"];
    
    CatManager *catManager = [CatManager new];
    NSNumber *resultsToGet = @100;
    
    
    [catManager getMoreCats: resultsToGet completionBlock:^(NSArray *catImages) {
        XCTAssertEqual(catImages.count, [resultsToGet integerValue], @"Array of catImages does not contain correct amount of results: should be: %@", resultsToGet);
        [expectation fulfill];
    }];
    
    
    [self waitForExpectationsWithTimeout:30 handler:^(NSError *error) { }];
}


/**
 *  CatManager has correct path for xml
 */
- (void) testCatManagerHasCorrectXmlPathToImages {
    CatManager *catManager = [CatManager new];
    
    XCTAssertEqualObjects(@"response.data.images.image", catManager.xmlPathToCatImages, @"Path to cat images is incorrect");
    
}
@end
