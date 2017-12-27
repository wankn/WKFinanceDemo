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


@implementation WKFinanceControllerHelper
#pragma mark - WKModuleControllerHelperProtocol
- (SBHttpDataLoader *)fetchConfigLoader {
    SBHttpDataLoader *loader = [WKHomeHttpProcess requestFinanceDataWithPageNo:1 pageSize:10 delegate:self];
    return loader;
}

- (NSArray<DataItemResult *> *)fetchDataSourceListWithDataItemResult:(DataItemResult *)result {
    return [self configureData:result];
}

#pragma mark - private methods
- (NSArray *)configureData:(DataItemResult *)result {
    
    NSMutableArray *mutableArr = [NSMutableArray array];
    DataItemDetail *detail = result.resultInfo;
    
    if ([WKUserInfoManager hasLogin]) {
        //普通标
        NSArray *productList = [detail getArray:@"productsList"];
        if (productList.count > 0) {
            DataItemResult *tmpResult = [[DataItemResult alloc] init];
            [tmpResult wk_bulidResultWithArray:productList];
            [tmpResult.resultInfo setObject:@(WKModuleTypeProduct) forKey:WKModuleTypeKey];
            [mutableArr addObject:tmpResult];
        }
    }
    return mutableArr;
}
@end
