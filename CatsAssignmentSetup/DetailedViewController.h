//
//  DetailedViewController.h
//  CatsAssignmentSetup
//
//  Created by Murat Ekrem Kolcalar on 11/21/17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FlickrPhoto.h"
#import "FlickrAPI.h"

@interface DetailedViewController : UIViewController <MKAnnotation, MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) FlickrPhoto *selectedPhoto;
@property (assign, nonatomic) CLLocationCoordinate2D passedCoordinates;

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property (weak, nonatomic) IBOutlet UINavigationItem *myNavigationItem;

@end
