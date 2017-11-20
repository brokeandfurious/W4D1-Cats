//
//  FlickrPhoto.h
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhoto : NSObject

@property (nonatomic,strong) NSString *flickrId;
@property (nonatomic,strong) NSString *owner;
@property (nonatomic,strong) NSString *secret;
// etc

@property (nonatomic,strong) UIImage *image;

- (instancetype)initWithInfo:(NSDictionary*)info;

- (NSURL*)imageURL;

@end
