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

@interface ViewController () <UICollectionViewDataSource>
@property (nonatomic,strong) NSArray<FlickrPhoto*>* photos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [FlickrAPI searchFor:@"cats" complete:^(NSArray *results) {
        self.photos = results;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // self.tableView reloadData or something
        }];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // get a cell
    UICollectionViewCell *cell;

    FlickrPhoto *photo = self.photos[indexPath.item];

    [FlickrAPI loadImage:photo completionHandler:^(UIImage *image) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //        cell.imageView.image = image;
        }];
    }];

    return cell;
}

@end
