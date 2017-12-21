//
//  WKModuleBasicProtocol.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/21.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SBLib/DataItemResult.h>
#import <SBLib/SBHttpDataLoader.h>

@class WKModuleControllerHelperProtocol;

/******************** 控制器 协议  ********************/
@protocol WKModuleControllerProtocol<NSObject>

@optional
/** 获取控制器Helper */
- (WKModuleControllerHelperProtocol *)createControllerHelper;

/** 事件响应 */
- (void)switchToTargetControllerWithType:(NSInteger)type params:(NSDictionary *)params;

@end



/******************** 控制器 Helper 协议  ********************/
@protocol WKModuleControllerHelperProtocol<NSObject>
@optional
/** 返回请求配置的loader */
- (SBHttpDataLoader *)fetchConfigLoader;

/** 获取子类需要定制的 */
- (NSArray *)fetchDataSourceListWithDataItemResult:(DataItemResult *)result;

@end



/******************** DataSource 协议  ********************/
@protocol WKModuleSectionDataSourceProtocol<NSObject>
/** 需要注册的cell */
- (NSArray *)fetchCellRegisterList;

/** items个数 */
- (CGFloat)numberOfItems;

/** cell的size */
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

/** sectionHeader */
- (UICollectionReusableView *)viewForSectionHeaderAtIndexPath:(NSIndexPath *)indexPath
                                               collectionView:(UICollectionView *)collectionView;

/** sectionFooter */
- (UICollectionReusableView *)viewForSectionFooterAtIndexPath:(NSIndexPath *)indexPath
                                               collectionView:(UICollectionView *)collectionView;

/** sectionHeader 的高度 */
- (CGSize)referenceSizeForHeaderInSection:(NSInteger)section;

/** sectionFooter 的高度 */
- (CGSize)referenceSizeForFooterInSection:(NSInteger)section;

/** 获取section的inset */
- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section;

/** 获取需要注册的 sectionHeader 的类名 */
- (NSArray *)fetchSectionHeaderReusableViewClassNameList;
/** 获取需要注册的 sectionFooter 的类名 */
- (NSArray *)fetchSectionFooterReusableViewClassNameList;

/** 获取 reusableViewHelper */
- (id)reusableViewHelperForSupplementaryElementOfKind:(NSString *)kind
                                          atIndexPath:(NSIndexPath *)indexPath;

/** 获取对应位置的cell类名 */
- (NSString *)cellClassNameAtIndexPath:(NSIndexPath *)indexPath;

/** 获取相应位置的cellHelper */
- (id)cellHelperAtIndexPath:(NSIndexPath *)indexPath;

/** 绑定数据源 */
- (void)configureDataItemResult:(DataItemResult *)result;
@end


/******************** Cell 协议  ********************/
@protocol WKModuleCellProtocol<NSObject>

/** 绑定cellHelper */
- (void)configureCellHelper:(id)cellHelper;

@optional
/** 代理 */
@property (nonatomic, weak) id<WKModuleControllerProtocol> delegate;

/** 绑定 indexPath */
- (void)configureIndexPath:(NSIndexPath *)indexPath;

/** 点击cell的事件 传递给cell自己处理 */
- (void)didSelect;

/** 控制器view即将显示 */
- (void)routeControllerViewWillAppear;
/** 控制器view已经显示 */
- (void)routeControllerViewDidAppear;
/** 控制器view即将消失 */
- (void)routeControllerViewWillDisappear;
/** 控制器view已经消失 */
- (void)routeControllerViewDidDisappear;

/** cell即将显示 */
- (void)routeCellWillDisplay;
/** cell结束显示 即消失了 */
- (void)routeCellDidEndDisplaying;


@end


/******************** CellHelper 协议  ********************/
@protocol WKModuleCellHelperProtocol<NSObject>
/** 绑定数据源 */
- (void)configureWithDataItemResult:(DataItemResult *)result;


@end



/******************** ReusableView 协议  ********************/
@protocol WKModuleReusableViewProtocol<NSObject>

@optional
/** 代理 */
@property (nonatomic, weak) id<WKModuleControllerProtocol> delegate;
/** 绑定 indexPath */
- (void)configureIndexPath:(NSIndexPath *)indexPath;

/** 绑定helper */
- (void)configureHelper:(id)helper;

@end
