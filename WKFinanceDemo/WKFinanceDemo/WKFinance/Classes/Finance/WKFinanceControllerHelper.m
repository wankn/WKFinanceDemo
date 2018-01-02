//
//  WKFinanceControllerHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/27.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKFinanceControllerHelper.h"
#import "WKHomeHttpProcess.h"
#import "DataItemResult+WK.h"
#import "WKUserInfoManager.h"

@interface WKFinanceControllerHelper ()
@property (nonatomic, strong) DataItemResult *moreResult;
@end

@implementation WKFinanceControllerHelper
#pragma mark - WKModuleControllerHelperProtocol
- (SBHttpDataLoader *)fetchConfigLoader {
    SBHttpDataLoader *loader = [WKHomeHttpProcess requestFinanceDataWithPageNo:1 pageSize:10 delegate:self];
    return loader;
}

/** 加载更多接口 */
- (SBHttpDataLoader *)fetchLoadMoreConfigLoaderWithPageIndex:(NSInteger)index {
    SBHttpDataLoader *loader = [WKHomeHttpProcess requestFinanceDataWithPageNo:index pageSize:10 delegate:self];
    return loader;
}

- (NSArray<DataItemResult *> *)fetchRefreshResultListWithDataItemResult:(DataItemResult *)result {
    NSArray *arr = [self configureData:result];
    if (arr.count > 0) {
        self.moreResult = arr.lastObject;
    }
    return arr;
}

/** 获取子类需要定制的加载更多数据 */
- (DataItemResult *)fetchLoadMoreResultWithDataItemResult:(DataItemResult *)result {
    NSArray *arr = [self configureData:result];
    DataItemResult *lastResult = nil;
    DataItemResult *moreResult = self.moreResult;
    if (arr.count > 0) {
        lastResult = arr.lastObject;
        if ([moreResult.resultInfo getInt:WKModuleTypeKey] == [lastResult.resultInfo getInt:WKModuleTypeKey]) {
            [moreResult appendItems:lastResult];
            lastResult = moreResult;
        }
        self.moreResult = lastResult;
        return lastResult;
    }
    return nil;
}

#pragma mark - private methods
- (NSArray *)configureData:(DataItemResult *)result {
    
    NSMutableArray *mutableArr = [NSMutableArray array];
    DataItemDetail *detail = result.resultInfo;
    //普通标
    NSArray *productList = [detail getArray:@"productsList"];
    DataItemResult *tmpResult = [[DataItemResult alloc] init];
    tmpResult.resultInfo = result.resultInfo;
    [tmpResult.resultInfo setObject:@(WKModuleTypeProduct) forKey:WKModuleTypeKey];
    if (productList.count > 0) {
        [tmpResult wk_bulidResultWithArray:productList];
    }
    [mutableArr addObject:tmpResult];
    return mutableArr;
}

#pragma mark - getters
- (DataItemResult *)moreResult {
    if (!_moreResult) {
        _moreResult = [[DataItemResult alloc] init];
    }
    return _moreResult;
}

@end
