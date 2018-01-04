//
//  WKFProductDetailController.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "WKFProductDetailController.h"
#import "WKFinanceConstant.h"
#import "WKFPorductDetailTopCell.h"

@interface WKFProductDetailController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) WKFProductDetailControllerHelper *helper;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation WKFProductDetailController

- (instancetype)initWithHelper:(WKFProductDetailControllerHelper *)helper {
    if (self = [super init]) {
        self.helper = helper;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.title = self.helper.navTitle;
    [self.view addSubview:self.collectionView];
    [self wkf_layoutView:self.collectionView forNavigationBar:self.navigationBar];
    [self.helper requestDetailData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        WKFPorductDetailTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WKFPorductDetailTopCell" forIndexPath:indexPath];
        return cell;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return CGSizeMake(APP_UI_SCREEN_FWIDTH, 210);
    }
    return CGSizeZero;
}

#pragma mark - getters
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView wk_configureRefresh];
        _collectionView.backgroundColor = self.view.backgroundColor;
        [_collectionView registerNib:[UINib nibWithNibName:@"WKFPorductDetailTopCell" bundle:nil] forCellWithReuseIdentifier:@"WKFPorductDetailTopCell"];
    }
    return _collectionView;
}


@end
