//
//  DetailedViewController.m
//  CatsAssignmentSetup
//
//  Created by Murat Ekrem Kolcalar on 11/21/17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController
@synthesize coordinate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [FlickrAPI searchForLocation:self.selectedPhoto.flickrID locationGot:^(CLLocationCoordinate2D result) {
        self.passedCoordinates = result;
        self.myNavigationItem.title = self.selectedPhoto.title;
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            MKCoordinateSpan span = MKCoordinateSpanMake(.5f, .5f);
            self.myMapView.region = MKCoordinateRegionMake(self.passedCoordinates, span);
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            [annotation setCoordinate:self.passedCoordinates];
            [annotation setTitle:self.selectedPhoto.title];
            [self.myMapView addAnnotation:annotation];
        }];
    }];

}

@end
