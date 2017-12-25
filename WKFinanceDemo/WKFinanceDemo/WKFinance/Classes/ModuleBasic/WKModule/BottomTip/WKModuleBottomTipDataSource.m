//
//  WKModuleBottomTipDataSource.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleBottomTipDataSource.h"
#import "WKFinanceConstant.h"
#import "WKModuleBottomTipCellHelper.h"

@interface WKModuleBottomTipDataSource()
@property (nonatomic, strong) WKModuleBottomTipCellHelper *cellHelper;
@end

@implementation WKModuleBottomTipDataSource
#pragma mark - WKModuleSectionDataSourceProtocol
/** 需要注册的cell */
- (NSArray *)fetchCellRegisterList {
    return @[@"WKModuleBottomTipCell"];
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
    return UIEdgeInsetsMake(0, 0, 10, 0);
}

/** 获取对应位置的cell类名 */
- (NSString *)cellClassNameAtIndexPath:(NSIndexPath *)indexPath {
    return @"WKModuleBottomTipCell";
}

/** 获取相应位置的cellHelper */
- (id)cellHelperAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHelper;
}

/** 绑定数据源 */
- (void)configureDataItemResult:(DataItemResult *)result {
    
    self.cellHelper = [[WKModuleBottomTipCellHelper alloc] init];
    if ([self.cellHelper respondsToSelector:@selector(configureWithDataItemResult:)]) {
        [self.cellHelper configureWithDataItemResult:result];
    }
}
@end
