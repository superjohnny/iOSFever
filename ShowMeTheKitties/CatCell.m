//
//  CatCell.m
//  ShowMeTheKitties
//
//  Created by John Green on 26/05/2015.
//  Copyright (c) 2015 AngryYak. All rights reserved.
//

#import "CatCell.h"
#import "UIImageView+AFNetworking.h"


@implementation CatCell

+ (NSString *) reuseIdentifier {
    return @"CatCell";
}


- (void) prepareForReuse {
    [super prepareForReuse];
    
    [self resetCell];
}

- (void) updateWithCat:(CatImage *) catImage {

    [self resetCell];
    
    //build request
    NSURL *url = [NSURL URLWithString:catImage.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //show busy
    [self.activityIndicator startAnimating];
    
    //fire request for image
    [self.mainImage setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        
        //update display
        self.mainImage.image = image;
        [self.activityIndicator stopAnimating];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [self.activityIndicator stopAnimating];
    }];
    
}


/**
 *  reset cell for reuse
 */
- (void) resetCell {
    [self.mainImage cancelImageRequestOperation]; //cancel any current requests
    self.mainImage.image = nil;
}

@end
