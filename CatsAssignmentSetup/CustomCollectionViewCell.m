//
//  CustomCollectionViewCell.m
//  CatsAssignmentSetup
//
//  Created by Larry Luk on 2017-11-20.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import "CustomCollectionViewCell.h"



@implementation CustomCollectionViewCell





-(void)setPhoto:(FlickrPhoto*)photo{
    
    [FlickrAPI loadImage:photo completionHandler:^(UIImage *result) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.catImage.image = result;
            self.catLabel.text = photo.title;
        }];
    }];

}

@end
