//
//  FiickrAPI.h
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"

@interface FlickrAPI : NSObject

+ (void)searchFor:(NSString*)tag complete:(void (^)(NSArray *results))done;

+ (void)loadImage:(FlickrPhoto*)photo completionHandler:(void (^)(UIImage *image))finishedCallback;

@end
