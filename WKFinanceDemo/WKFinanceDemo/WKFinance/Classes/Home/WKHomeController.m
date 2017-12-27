//
//  WKHomeController.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeController.h"
#import "WKHomeControllerHelper.h"

@interface WKHomeController ()

@end

@implementation WKHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - WKBasicControllerProtocol
- (BOOL)hideNavigationBar {
    return YES;
}

#pragma mark - WKModuleControllerProtocol
- (id)createControllerHelper {
    WKHomeControllerHelper *helper = [[WKHomeControllerHelper alloc] init];
    __weak typeof(self) weakSelf = self;
    helper.requestFinishBlock = ^(BOOL hasError, NSString *message) {
        [weakSelf.mainCollectionView wk_endRefresh];
        [weakSelf.mainCollectionView reloadData];
    };
    return helper;
}

@end
