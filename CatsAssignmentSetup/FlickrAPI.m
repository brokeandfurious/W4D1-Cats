//
//  FiickrAPI.m
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import "FlickrAPI.h"

@implementation FlickrAPI

+ (void)searchForLocation: (NSString*)flickrID locationGot:(void (^)(CLLocationCoordinate2D))locationDone {
    NSURL* locURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.geo.getLocation&api_key=ce870f2223c803a2c5583692edb3471c&photo_id=%@&extras=url_m&format=json&nojsoncallback=1",flickrID]];
    
    NSURLSessionTask *task =
    [[NSURLSession sharedSession]
     dataTaskWithURL:locURL
     completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
         // begin standard error handling
         if (error != nil) {
             NSLog(@"Error while making request: %@", error.localizedDescription);
             abort();
         }
         NSHTTPURLResponse *resp = (NSHTTPURLResponse*)response;
         if (resp.statusCode > 299) {
             NSLog(@"Bad status code: %ld", resp.statusCode);
             abort();
         }
         // end standard error handling
         
         // parse response
         NSError *err = nil;
         NSDictionary *result = [NSJSONSerialization
                                 JSONObjectWithData:data
                                 options:0
                                 error:&err];
         if (err != nil) {
             NSLog(@"Something has gone wrong parsing JSON: %@", err.localizedDescription);
             abort();
         }
         
         NSDictionary *coordinates = result[@"photo"][@"location"];
         double latitude = [coordinates[@"latitude"]doubleValue];
         double longitude = [coordinates[@"longitude"]doubleValue];
         CLLocationCoordinate2D shittyCoordinates = CLLocationCoordinate2DMake(latitude, longitude);

     
         locationDone(shittyCoordinates);
         
     }];
    
    [task resume];
    
}

+ (void)searchFor:(NSString *)tag complete:(void (^)(NSArray *))done
{
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=ce870f2223c803a2c5583692edb3471c&tags=%@&has_geo=1&extras=url_m", tag]];

    NSURLSessionTask *task =
    [[NSURLSession sharedSession]
     dataTaskWithURL:url
     completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
         // begin standard error handling
         if (error != nil) {
             NSLog(@"Error while making request: %@", error.localizedDescription);
             abort();
         }
         NSHTTPURLResponse *resp = (NSHTTPURLResponse*)response;
         if (resp.statusCode > 299) {
             NSLog(@"Bad status code: %ld", resp.statusCode);
             abort();
         }
         // end standard error handling

         // parse response
         NSError *err = nil;
         NSDictionary *result = [NSJSONSerialization
                                 JSONObjectWithData:data
                                 options:0
                                 error:&err];
         if (err != nil) {
             NSLog(@"Something has gone wrong parsing JSON: %@", err.localizedDescription);
             abort();
         }

         NSMutableArray *photos = [[NSMutableArray alloc] init];
         for (NSDictionary *photoInfo in result[@"photos"][@"photo"]) {
             [photos addObject:[[FlickrPhoto alloc] initWithInfo:photoInfo]];
         }

         done([NSArray arrayWithArray:photos]);
     }];

    [task resume];
}

+ (void)loadImage:(FlickrPhoto*)photo completionHandler:(void (^)(UIImage *))finishedCallback
{
    // checking if we've already downloaded the photo so we don't waste time doing it again
    if (photo.image != nil) {
        // if we already have it, immediately invoke the callback
        finishedCallback(photo.image);
    } else {
        NSURLSessionTask *task =
        [[NSURLSession sharedSession]
         downloadTaskWithURL:photo.imageURL
         completionHandler:^(NSURL* location, NSURLResponse* response, NSError* error) {
//             UIImage *img = [UIImage imageWithContentsOfFile:location.path];
             // or
            UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];

             // save downloaded image on the photo object so we don't have to redownload it
             photo.image = img;
             // invoke the callback
             finishedCallback(img);
         }];
        
        [task resume];
    }
}

@end
