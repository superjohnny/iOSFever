//
//  CatManager.m
//  ShowMeTheKitties
//
//  Created by John Green on 26/05/2015.
//  Copyright (c) 2015 AngryYak. All rights reserved.
//

#import "CatManager.h"
#import "AFNetworking.h"
#import "CatImage.h"
#import "SHXMLParser.h"


@implementation CatManager

#pragma mark - Properties

- (NSString *) xmlPathToCatImages {
    return @"response.data.images.image";
}


#pragma mark - Methods

/**
 *  Request base url
 *
 *  @return NSString of url
 */
- (NSString *) baseUrl {
    return @"http://thecatapi.com/api/images/get";
}


/**
 *  Assembles base url with requested number of results to fetch
 *
 *  @param numberOfCats NSNumber of results to fetch
 *
 *  @return Completed NSString of url
 */
- (NSString *) urlWithResultCount: (NSNumber *) numberOfCats {
    
    return [NSString stringWithFormat:@"%@?format=xml&results_per_page=%@", [self baseUrl], numberOfCats];
    
}

- (void)getMoreCats:(NSNumber *)numberOfCats completionBlock:(void (^)(NSArray * catImages)) completion {
    
    
    if (numberOfCats == nil || [numberOfCats integerValue] == 0 ) {
        //nothing to do?
        
        if (completion)
            completion(nil);
    }
    
    
    //Build request to accept xml
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/xml"];
    [manager setResponseSerializer:responseSerializer];
    
    
    NSString *url = [self urlWithResultCount:numberOfCats];

    //get those kitties
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSData *responseData = (NSData *)responseObject;
        
        //parse results
        SHXMLParser *parser = [SHXMLParser new];
        NSDictionary *results = [parser parseData:responseData];
        NSArray *items = [SHXMLParser getDataAtPath:[self xmlPathToCatImages] fromResultObject:results];
        
        //straight into something nice to work with.
        NSArray *cats = [SHXMLParser convertDictionaryArray:items
                                 toObjectArrayWithClassName:NSStringFromClass([CatImage class])
                                             classVariables:[CatImage propertiesToDeserialize]];
        
        if (completion)
            completion(cats);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
        if (completion)
            completion(nil);
    }];
    
}






@end
