//
//  FlickrPhoto.h
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhoto : NSObject

@property (nonatomic,strong) NSString *flickrID;
@property (nonatomic,strong) NSString *serverID;
@property (nonatomic,strong) NSString *farmID;
@property (nonatomic,strong) NSString *secretID;
@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) UIImage *image;

- (instancetype)initWithInfo:(NSDictionary*)info;

- (NSURL*)imageURL;

@end
