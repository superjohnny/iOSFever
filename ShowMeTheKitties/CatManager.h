//
//  CatManager.h
//  ShowMeTheKitties
//
//  Created by John Green on 26/05/2015.
//  Copyright (c) 2015 AngryYak. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Cat Manager to manage all those kitties
 */
@interface CatManager : NSObject

/**
 *  dot annotated path to cat image objects
 */
@property (nonatomic, readonly) NSString *xmlPathToCatImages;

/**
 *  gets the specified number of cats from the service
 *
 *  @param numberOfCats number of cats to request
 *  @param completion   completion block called when request completed
 */
- (void)getMoreCats:(NSNumber *)numberOfCats completionBlock:(void (^)(NSArray * catImages)) completion;

@end
