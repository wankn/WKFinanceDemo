//
//  WKModuleAdImageDataSource.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleAdImageDataSource.h"
#import "WKFinanceConstant.h"
#import "WKModuleAdImageCellHelper.h"
#import "NSObject+WKModuleHome.h"

@interface WKModuleAdImageDataSource()
@property (nonatomic, strong) WKModuleAdImageCellHelper *cellHelper;
@property (nonatomic, assign) WKModuleSeparatorType separatorType;
@end

@implementation WKModuleAdImageDataSource
#pragma mark - WKModuleSectionDataSourceProtocol
/** 需要注册的cell */
- (NSArray *)fetchCellRegisterList {
    return @[@"WKModuleAdImageCell"];
}

/** items个数 */
- (CGFloat)numberOfItems {
    return 1;
}

/** cell的size */
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat scale = 750/170.0;
    CGFloat height = APP_UI_SCREEN_FWIDTH/scale;
    return CGSizeMake(APP_UI_SCREEN_FWIDTH, height);
}

/** 获取section的inset */
- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section {
    return [self wk_sectionInsetsWithModuleSeparatorType:self.separatorType];
}

/** 获取对应位置的cell类名 */
- (NSString *)cellClassNameAtIndexPath:(NSIndexPath *)indexPath {
    return @"WKModuleAdImageCell";
}

/** 获取相应位置的cellHelper */
- (id)cellHelperAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHelper;
}

/** 绑定数据源 */
- (void)configureDataItemResult:(DataItemResult *)result {
    self.separatorType = [result.resultInfo getInt:WKModuleSeparatorTypeKey];
    self.cellHelper = [[WKModuleAdImageCellHelper alloc] init];
    if ([self.cellHelper respondsToSelector:@selector(configureWithDataItemResult:)]) {
        [self.cellHelper configureWithDataItemResult:result];
    }
}

@end
