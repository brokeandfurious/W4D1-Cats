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
        _flickrID = info[@"id"];
        _serverID = info[@"server"];
        _farmID = info[@"farm"];
        _secretID = info[@"secret"];
        _title = info[@"title"];
    }
    return self;
}


-(NSURL *)imageURL {
    // https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", self.farmID, self.serverID, self.flickrID, self.secretID]];
    return url;
}

@end
