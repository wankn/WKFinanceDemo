//
//  WKModuleBottomTipCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleBottomTipCellHelper.h"

@implementation WKModuleBottomTipCellHelper

#pragma mark - WKModuleCellHelperProtocol
/** 绑定数据源 */
- (void)configureWithDataItemResult:(DataItemResult *)result {
    
}

#pragma mark - getters
- (NSString *)tipString {
    return @"理财有风险，投资需谨慎";
}


@end
