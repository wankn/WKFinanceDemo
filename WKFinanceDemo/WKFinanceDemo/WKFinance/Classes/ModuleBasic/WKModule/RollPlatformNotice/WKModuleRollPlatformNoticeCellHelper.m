//
//  WKModuleRollPlatformNoticeCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleRollPlatformNoticeCellHelper.h"
#import <SBLib/DataItemResult.h>

@interface WKModuleRollPlatformNoticeCellHelper()
@property (nonatomic, strong) DataItemResult *result;
@property (nonatomic, strong) NSArray *titleList;
@end

@implementation WKModuleRollPlatformNoticeCellHelper

#pragma mark - WKModuleCellHelperProtocol
/** 绑定数据源 */
- (void)configureWithDataItemResult:(DataItemResult *)result {
    self.result = result;
}

#pragma mark - getters
- (NSArray *)titleList {
    NSMutableArray *arr = [NSMutableArray array];
    for (DataItemDetail *detail in self.result.dataList) {
        NSString *title = [detail getString:@"hotTitle"];
        [arr addObject:title];
    }
    return arr;
}

@end
