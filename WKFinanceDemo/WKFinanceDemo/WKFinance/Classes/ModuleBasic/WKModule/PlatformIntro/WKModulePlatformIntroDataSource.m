//
//  WKModulePlatformIntroDataSource.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModulePlatformIntroDataSource.h"
#import "WKFinanceConstant.h"
#import "NSObject+WKModuleHome.h"

@interface WKModulePlatformIntroDataSource()
@property (nonatomic, assign) WKModuleSeparatorType separatorType;
@end

@implementation WKModulePlatformIntroDataSource

#pragma mark - WKModuleSectionDataSourceProtocol
/** 需要注册的cell */
- (NSArray *)fetchCellRegisterList {
    return @[@"WKModulePlatformIntroCell"];
}

/** items个数 */
- (CGFloat)numberOfItems {
    return 1;
}

/** cell的size */
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(APP_UI_SCREEN_FWIDTH, 70);
}

/** 获取section的inset */
- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section {
    return [self wk_sectionInsetsWithModuleSeparatorType:self.separatorType];
}

/** 获取对应位置的cell类名 */
- (NSString *)cellClassNameAtIndexPath:(NSIndexPath *)indexPath {
    return @"WKModulePlatformIntroCell";
}

/** 获取相应位置的cellHelper */
- (id)cellHelperAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

/** 绑定数据源 */
- (void)configureDataItemResult:(DataItemResult *)result {
    self.separatorType = [result.resultInfo getInt:WKModuleSeparatorTypeKey];
}
@end
