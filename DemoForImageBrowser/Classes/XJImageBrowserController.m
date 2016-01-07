//
//  XJImageBrowserController.m
//  DemoForImageBrowser
//
//  Created by Silence on 16/1/6.
//  Copyright © 2016年 silence. All rights reserved.
//

#import "XJImageBrowserController.h"
#import "XJCollectionViewLayout.h"

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

static NSString *const kCollectionViewCell = @"CollectionViewCell";

@interface XJImageBrowserController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end
@implementation XJImageBrowserController{
    __weak UICollectionView *_collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self xj_configSubViews];
}

- (void)xj_configSubViews {
    XJCollectionViewLayout *flowLayout = [[XJCollectionViewLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    [self.view insertSubview:collectionView atIndex:0];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    _collectionView = collectionView;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewCell];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


@end
