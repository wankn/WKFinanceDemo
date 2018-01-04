//
//  WKFinanceController.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKFinanceController.h"
#import "WKFinanceControllerHelper.h"

@interface WKFinanceController ()

@end

@implementation WKFinanceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.title = @"理财产品";
}

#pragma mark - WKBasicControllerProtocol
- (BOOL)hideNavigationBar {
    return NO;
}

#pragma mark - WKModuleControllerProtocol
- (id)createControllerHelper {
    WKFinanceControllerHelper *helper = [[WKFinanceControllerHelper alloc] init];
    __weak typeof(self) weakSelf = self;
    helper.requestFinishBlock = ^(BOOL hasError, NSString *message, BOOL hasMore) {
        [weakSelf.mainCollectionView wk_endRefresh];
        [weakSelf.mainCollectionView reloadData];
        if (hasMore) {
            [weakSelf.mainCollectionView wk_setLoadMoreEnable:YES];
            [weakSelf.mainCollectionView wk_endLoadMore];
        } else {
            [weakSelf.mainCollectionView wk_endLoadMoreWithNoMoreData];
        }
    };
    helper.requestMoreFinishBlock = ^(BOOL hasError, NSString *message, BOOL hasMore) {
        [weakSelf.mainCollectionView wk_endLoadMore];
        [weakSelf.mainCollectionView reloadData];
        if (hasMore) {
            [weakSelf.mainCollectionView wk_endLoadMore];
        } else {
            [weakSelf.mainCollectionView wk_endLoadMoreWithNoMoreData];
        }
    };
    return helper;
}

@end
