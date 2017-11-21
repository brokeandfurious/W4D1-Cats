//
//  CustomCollectionViewCell.h
//  CatsAssignmentSetup
//
//  Created by Larry Luk on 2017-11-20.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrAPI.h"
#import "FlickrPhoto.h"

@interface CustomCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
