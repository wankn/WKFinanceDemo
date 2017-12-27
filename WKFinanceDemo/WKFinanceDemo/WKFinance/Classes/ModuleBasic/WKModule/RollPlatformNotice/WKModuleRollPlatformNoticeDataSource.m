//
//  WKModuleRollPlatformNoticeDataSource.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleRollPlatformNoticeDataSource.h"
#import "WKFinanceConstant.h"
#import "WKModuleRollPlatformNoticeCellHelper.h"
#import "NSObject+WKModuleHome.h"

@interface WKModuleRollPlatformNoticeDataSource()
@property (nonatomic, strong) WKModuleRollPlatformNoticeCellHelper *cellHelper;
@property (nonatomic, assign) WKModuleSeparatorType separatorType;
@end

@implementation WKModuleRollPlatformNoticeDataSource

#pragma mark - WKModuleSectionDataSourceProtocol
/** 需要注册的cell */
- (NSArray *)fetchCellRegisterList {
    return @[@"WKModuleRollPlatformNoticeCell"];
}

/** items个数 */
- (CGFloat)numberOfItems {
    return 1;
}

/** cell的size */
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(APP_UI_SCREEN_FWIDTH, 40);
}

/** 获取section的inset */
- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section {
    return [self wk_sectionInsetsWithModuleSeparatorType:self.separatorType];
}

/** 获取对应位置的cell类名 */
- (NSString *)cellClassNameAtIndexPath:(NSIndexPath *)indexPath {
    return @"WKModuleRollPlatformNoticeCell";
}

/** 获取相应位置的cellHelper */
- (id)cellHelperAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHelper;
}

/** 绑定数据源 */
- (void)configureDataItemResult:(DataItemResult *)result {
    self.separatorType = [result.resultInfo getInt:WKModuleSeparatorTypeKey];
    self.cellHelper = [[WKModuleRollPlatformNoticeCellHelper alloc] init];
    if ([self.cellHelper respondsToSelector:@selector(configureWithDataItemResult:)]) {
        [self.cellHelper configureWithDataItemResult:result];
    }
}

@end
