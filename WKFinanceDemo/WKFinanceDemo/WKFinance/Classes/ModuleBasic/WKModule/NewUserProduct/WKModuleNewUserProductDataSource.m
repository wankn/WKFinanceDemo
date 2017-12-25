//
//  WKModuleNewUserProductDataSource.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleNewUserProductDataSource.h"
#import "WKFinanceConstant.h"
#import "WKNewUserProductCellHelper.h"
#import "WKModuleTitleReusableView.h"

@interface WKModuleNewUserProductDataSource()
@property (nonatomic, strong) NSMutableArray *cellHelperList;
@property (nonatomic, strong) DataItemResult *result;
@end

@implementation WKModuleNewUserProductDataSource

#pragma mark - WKModuleSectionDataSourceProtocol
/** 需要注册的cell */
- (NSArray *)fetchCellRegisterList {
    return @[@"WKModuleNewUserProductCell"];
}

/** items个数 */
- (CGFloat)numberOfItems {
    return self.cellHelperList.count;
}

/** cell的size */
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(APP_UI_SCREEN_FWIDTH, 140);
}

/** 获取需要注册的 sectionHeader 的类名 */
- (NSArray *)fetchSectionHeaderReusableViewClassNameList {
    return @[@"WKModuleTitleReusableView"];
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
    return CGSizeMake(APP_UI_SCREEN_FWIDTH, 50.0f);
}

/** 获取section的inset */
- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 10, 0);
}

/** 获取对应位置的cell类名 */
- (NSString *)cellClassNameAtIndexPath:(NSIndexPath *)indexPath {
    return @"WKModuleNewUserProductCell";
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
            WKNewUserProductCellHelper *cellHelper = [[WKNewUserProductCellHelper alloc] init];
            DataItemResult *tmpResult = [[DataItemResult alloc] init];
            [tmpResult.resultInfo appendItems:obj];
            if ([cellHelper respondsToSelector:@selector(configureWithDataItemResult:)]) {
                [cellHelper configureWithDataItemResult:tmpResult];
            }
            [self.cellHelperList addObject:cellHelper];
        }
    }
}

#pragma mark - getters
- (NSMutableArray *)cellHelperList {
    if (!_cellHelperList) {
        _cellHelperList = [NSMutableArray array];
    }
    return _cellHelperList;
}

@end
