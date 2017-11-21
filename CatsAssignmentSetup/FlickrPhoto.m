//
//  FlickrPhoto.m
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto

- (instancetype)initWithInfo:(NSDictionary *)info
{
    self = [super init];
    if (self) {
        _server = info[@"server"];
        _farm = info[@"farm"];
        _ownerId = info[@"id"];
        _secret = info[@"secret"];
        _title = info[@"title"];
    }
    return self;
}

-(NSURL *)imageURL {
    return [NSURL URLWithString: [NSString stringWithFormat: @"https://farm%@.staticflickr.com/%@/%@_%@.jpg", self.farm, self.server, self.ownerId, self.secret]];
}

@end
