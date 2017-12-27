//
//  WKModuleBannerDataSource.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleBannerDataSource.h"
#import "WKFinanceConstant.h"
#import "WKCarouselBannerCellHelper.h"
#import "NSObject+WKModuleHome.h"

@interface WKModuleBannerDataSource()
@property (nonatomic, strong) WKCarouselBannerCellHelper *cellHelper;
@property (nonatomic, assign) WKModuleSeparatorType separatorType;
@end

@implementation WKModuleBannerDataSource

#pragma mark - WKModuleSectionDataSourceProtocol
/** 需要注册的cell */
- (NSArray *)fetchCellRegisterList {
    return @[@"WKCarouselBannerCell"];
}

/** items个数 */
- (CGFloat)numberOfItems {
    return 1;
}

/** cell的size */
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(APP_UI_SCREEN_FWIDTH, 180);
}

/** 获取section的inset */
- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section {
    return [self wk_sectionInsetsWithModuleSeparatorType:self.separatorType];
}

/** 获取对应位置的cell类名 */
- (NSString *)cellClassNameAtIndexPath:(NSIndexPath *)indexPath {
    return @"WKCarouselBannerCell";
}

/** 获取相应位置的cellHelper */
- (id)cellHelperAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHelper;
}

/** 绑定数据源 */
- (void)configureDataItemResult:(DataItemResult *)result {
    self.separatorType = [result.resultInfo getInt:WKModuleSeparatorTypeKey];
    self.cellHelper = [[WKCarouselBannerCellHelper alloc] init];
    if ([self.cellHelper respondsToSelector:@selector(configureWithDataItemResult:)]) {
        [self.cellHelper configureWithDataItemResult:result];
    }
}

@end
