//
//  ViewController.m
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import "ViewController.h"
#import "FlickrAPI.h"
#import "FlickrPhoto.h"
#import "CustomCollectionViewCell.h"
#import "DetailedViewController.h"

@interface ViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSArray<FlickrPhoto*>* photos;
@property (nonatomic) CLLocationCoordinate2D placeholderForCoordinates;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [FlickrAPI searchFor:@"samoyed" complete:^(NSArray *results) {
        self.photos = results;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(CustomCollectionViewCell *)sender {
    if ([[segue identifier]isEqualToString:@"segueToMap"]) {
        NSIndexPath *path = [self.collectionView indexPathsForSelectedItems][0];
        FlickrPhoto *photo = self.photos[path.item];
        DetailedViewController *destinationVC = segue.destinationViewController;
        [destinationVC setSelectedPhoto:photo];
    }
}

#pragma mark - Collection View

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    FlickrPhoto *photo = self.photos[indexPath.item];

    [FlickrAPI loadImage:photo completionHandler:^(UIImage *image) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    cell.image.image = image;
            cell.label.text = photo.title;
            
        }];
    }];
    
//    [FlickrAPI searchForLocation:photo.flickrID locationGot:^(CLLocationCoordinate2D shittyCoordinates) {
//        NSLog(@"Coord Test: %.4f, %.4f", shittyCoordinates.latitude, shittyCoordinates.longitude);
//        self.placeholderForCoordinates = shittyCoordinates;
//    }];
    
    return cell;
}

@end
