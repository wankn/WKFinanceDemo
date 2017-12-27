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
}

#pragma mark - WKModuleControllerProtocol
- (id)createControllerHelper {
    WKFinanceControllerHelper *helper = [[WKFinanceControllerHelper alloc] init];
    __weak typeof(self) weakSelf = self;
    helper.requestFinishBlock = ^(BOOL hasError, NSString *message) {
        [weakSelf.mainCollectionView wk_endRefresh];
        [weakSelf.mainCollectionView reloadData];
    };
    return helper;
}

@end
