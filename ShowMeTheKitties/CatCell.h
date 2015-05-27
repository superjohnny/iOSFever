//
//  CatCell.h
//  ShowMeTheKitties
//
//  Created by John Green on 26/05/2015.
//  Copyright (c) 2015 AngryYak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatImage.h"


/**
 *  Cell to display cat image
 */
@interface CatCell : UITableViewCell

/**
 *  Cat Cell reuse id
 *
 *  @return NSString of identifier
 */
+ (NSString *) reuseIdentifier;


/**
 *  Main cat image
 */
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;

/**
 *  Busy indicator
 */
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


/**
 *  Updates cell with given cat image
 *
 *  @param catImage update with this
 */
- (void) updateWithCat:(CatImage *) catImage;

@end
