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

@interface ViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSArray<FlickrPhoto*>* photos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [FlickrAPI searchFor:@"samoyed" complete:^(NSArray *results) {
        self.photos = results;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

    return cell;
}

@end
