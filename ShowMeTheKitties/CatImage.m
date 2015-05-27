//
//  CatImage.m
//  ShowMeTheKitties
//
//  Created by John Green on 26/05/2015.
//  Copyright (c) 2015 AngryYak. All rights reserved.
//

#import "CatImage.h"

@implementation CatImage

+ (NSArray *) propertiesToDeserialize {
    return @[@"url", @"source_url"];
}

@end
