//
//  CustomCollectionViewCell.h
//  CatsAssignmentSetup
//
//  Created by Larry Luk on 2017-11-20.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"
#import "FlickrAPI.h"

@interface CustomCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *catImage;
@property (weak, nonatomic) IBOutlet UILabel *catLabel;

@property (nonatomic) FlickrPhoto* photo;



@end
