//
//  FlickrPhoto.h
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhoto : NSObject

@property (nonatomic,strong) NSString *server;
@property (nonatomic,strong) NSString *farm;
@property (nonatomic,strong) NSString *ownerId;
@property (nonatomic,strong) NSString *secret;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIImage *image;

- (instancetype)initWithInfo:(NSDictionary*)info;

- (NSURL*)imageURL;

@end
