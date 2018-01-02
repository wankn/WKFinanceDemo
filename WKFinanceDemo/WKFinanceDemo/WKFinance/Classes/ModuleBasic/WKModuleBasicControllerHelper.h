//
//  WKModuleBasicControllerHelper.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/21.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKModuleBasicProtocol.h"
#import "WKFinanceConstant.h"

@interface WKModuleBasicControllerHelper : NSObject<WKModuleControllerHelperProtocol,SBHttpDataLoaderDelegate>

@property (nonatomic, readonly) NSMutableArray<id<WKModuleSectionDataSourceProtocol>> *sectionDataSourceList;
@property (nonatomic, readonly) NSSet *cellNameSet;  /**< cell类名 集合 注册用 */
@property (nonatomic, readonly) NSSet *sectionHeaderNameSet; /**< sectionHeader类名集合 注册用 */
@property (nonatomic, readonly) NSSet *sectionFooterNameSet; /**< sectionFooter类名集合 注册用 */

@property (nonatomic, copy) void(^reloadMainViewBlock)(void); /**< 刷新主页block 非请求类调用 */
@property (nonatomic, copy) void(^requestFinishBlock)(BOOL hasError,NSString *message,BOOL hasMore); /**< 刷新结束 */
@property (nonatomic, copy) void(^requestMoreFinishBlock)(BOOL hasError,NSString *message,BOOL hasMore); /**< 加载更多结束 */

/** 刷新数据 */
- (void)requestData;

/** 加载更多 */
- (void)requestMoreData:(BOOL)isFirstPage;

@end
