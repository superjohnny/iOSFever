//
//  CatImage.h
//  ShowMeTheKitties
//
//  Created by John Green on 26/05/2015.
//  Copyright (c) 2015 AngryYak. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  A Cat image
 */
@interface CatImage : NSObject

/**
 *  List of property names to include in deserializing
 *
 *  @return NSArray on NSString property names.
 */
+ (NSArray *) propertiesToDeserialize;

/**
 *  Url of cat image
 */
@property (nonatomic, strong) NSString *url;

/**
 *  Source Url of cat image
 */
@property (nonatomic, strong) NSString *source_url;

@end
