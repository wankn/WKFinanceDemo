//
//  WKModuleAdImageCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleAdImageCellHelper.h"
#import <SBLib/DataItemResult.h>

@interface WKModuleAdImageCellHelper()
@property (nonatomic, strong) DataItemResult *result;
@end

@implementation WKModuleAdImageCellHelper

#pragma mark - WKModuleCellHelperProtocol
/** 绑定数据源 */
- (void)configureWithDataItemResult:(DataItemResult *)result {
    self.result = result;
}

#pragma mark - getters
- (NSString *)adImageUrl {
    return [self.result.resultInfo getString:@"ImageUrl"];
}

- (NSString *)nativeImageName {
    return [self.result.resultInfo getString:@"NativeImageName"];
}

@end
