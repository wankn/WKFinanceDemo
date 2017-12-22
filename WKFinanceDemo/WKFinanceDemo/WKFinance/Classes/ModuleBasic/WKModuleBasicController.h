//
//  WKModuleBasicController.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/21.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKBasicController.h"
#import "WKModuleBasicControllerHelper.h"
#import "UIScrollView+WKRefresh.h"

@interface WKModuleBasicController : WKBasicController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,WKModuleControllerProtocol>

@property (nonatomic, strong) UICollectionView *mainCollectionView;
@property (nonatomic, strong) WKModuleBasicControllerHelper *helper;


- (void)manualRefresh:(BOOL)manualRefresh;

@end
