//
//  WKModuleProductDataSource.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleProductDataSource.h"
#import "WKFinanceConstant.h"
#import "WKModuleTitleReusableView.h"
#import "WKModuleProductCellHelper.h"
#import "NSObject+WKModuleHome.h"

@interface WKModuleProductDataSource()
@property (nonatomic, strong) NSMutableArray *cellHelperList;
@property (nonatomic, strong) DataItemResult *result;
@end

@implementation WKModuleProductDataSource

/** 需要注册的cell */
- (NSArray *)fetchCellRegisterList {
    return @[@"WKModuleProductCell"];
}

/** items个数 */
- (CGFloat)numberOfItems {
    return self.cellHelperList.count;
}

/** cell的size */
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(APP_UI_SCREEN_FWIDTH, 110.0);
}

/** sectionHeader */
- (UICollectionReusableView *)viewForSectionHeaderAtIndexPath:(NSIndexPath *)indexPath
                                               collectionView:(UICollectionView *)collectionView {
    WKModuleTitleReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WKModuleTitleReusableView" forIndexPath:indexPath];
    reusableView.backgroundColor = [UIColor whiteColor];
    NSString *title = [self.result.resultInfo getString:@"newTitle"];
    [reusableView configureTitle:title];
    return reusableView;
}

/** sectionHeader 的高度 */
- (CGSize)referenceSizeForHeaderInSection:(NSInteger)section {
    if ([self hasSectionHeader]) {
        return CGSizeMake(APP_UI_SCREEN_FWIDTH, 50.0f);
    }
    return CGSizeZero;
}

/** 获取section的inset */
- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section {
    WKModuleSeparatorType type = [self.result.resultInfo getInt:WKModuleSeparatorTypeKey];
    return [self wk_sectionInsetsWithModuleSeparatorType:type];
}

- (CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

/** 获取需要注册的 sectionHeader 的类名 */
- (NSArray *)fetchSectionHeaderReusableViewClassNameList {
    return @[@"WKModuleTitleReusableView"];
}

/** 获取对应位置的cell类名 */
- (NSString *)cellClassNameAtIndexPath:(NSIndexPath *)indexPath {
    return @"WKModuleProductCell";
}

/** 获取相应位置的cellHelper */
- (id)cellHelperAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellHelperList.count > indexPath.row) {
        return self.cellHelperList[indexPath.row];
    }
    return nil;
}

/** 绑定数据源 */
- (void)configureDataItemResult:(DataItemResult *)result {
    self.result = result;
    [self.cellHelperList removeAllObjects];
    for (id obj in result.dataList) {
        if ([obj isKindOfClass:[DataItemDetail class]]) {
            WKModuleProductCellHelper *helper = [[WKModuleProductCellHelper alloc] init];
            DataItemResult *tmpResult = [[DataItemResult alloc] init];
            [tmpResult.resultInfo appendItems:obj];
            if ([helper respondsToSelector:@selector(configureWithDataItemResult:)]) {
                [helper configureWithDataItemResult:tmpResult];
            }
            [self.cellHelperList addObject:helper];
        }
    }
}

#pragma mark - private methods
- (BOOL)hasSectionHeader {
    NSString *title = [self.result.resultInfo getString:@"newTitle"];
    return title.length != 0;
}

#pragma mark - getters
- (NSMutableArray *)cellHelperList {
    if (!_cellHelperList) {
        _cellHelperList = [NSMutableArray array];
    }
    return _cellHelperList;
}

@end
