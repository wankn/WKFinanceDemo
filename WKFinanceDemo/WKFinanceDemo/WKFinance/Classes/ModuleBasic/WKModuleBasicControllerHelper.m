//
//  WKModuleBasicControllerHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/21.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleBasicControllerHelper.h"
#import <SBLib/SBHttpDataLoader.h>
#import "WKModuleHandler.h"

@interface WKModuleBasicControllerHelper()<SBHttpDataLoaderDelegate>
@property (nonatomic, strong) SBHttpDataLoader *configLoader;
@property (nonatomic, strong) NSMutableArray<id<WKModuleSectionDataSourceProtocol>> *sectionDataSourceList;
@end

@implementation WKModuleBasicControllerHelper

#pragma mark - public methods
/** 刷新数据 */
- (void)requestData {
    
    [self.configLoader stopLoading];
    if ([self respondsToSelector:@selector(fetchConfigLoader)]) {
        self.configLoader = [self fetchConfigLoader];
    }
}

#pragma mark - private methods
- (void)loadDataSourceList:(NSArray *)resultList {
    [self.sectionDataSourceList removeAllObjects];
    for (DataItemResult *result in resultList) {
        NSInteger moduleType = [result.resultInfo getInt:@"ModuleType"];
        NSString *clsName = [WKModuleHandler dataSourceClassNameWithModuleType:moduleType];
        if (clsName) {
            Class class = NSClassFromString(clsName);
            id<WKModuleSectionDataSourceProtocol> dataSource = [[class alloc] init];;
            if ([dataSource respondsToSelector:@selector(configureDataItemResult:)]) {
                [dataSource configureDataItemResult:result];
            }
            [self.sectionDataSourceList addObject:dataSource];
        }
    }
}

#pragma mark - SBHttpDataLoaderDelegate
- (void)dataLoader:(SBHttpDataLoader *)dataLoader onReceived:(DataItemResult *)result {
    if (dataLoader == self.configLoader) {
        if (!result.hasError) {
            if ([self respondsToSelector:@selector(fetchDataSourceListWithDataItemResult:)]) {
                NSArray *arr = [self fetchDataSourceListWithDataItemResult:result];
                [self loadDataSourceList:arr];
            }
        }
        if (self.requestFinishBlock) {
            self.requestFinishBlock(result.hasError, result.message);
        }
    }
}

#pragma mark - getters
/**< cell类名 集合 注册用 */
- (NSSet *)cellNameSet {
    NSMutableSet *set = [NSMutableSet set];
    NSArray *dataSourceArr = [WKModuleHandler supportableDataSourceList];
    for (NSString *className in dataSourceArr) {
        Class class = NSClassFromString(className);
        id<WKModuleSectionDataSourceProtocol> dataSource = [[class alloc] init];
        if ([dataSource respondsToSelector:@selector(fetchCellRegisterList)]) {
            [set addObjectsFromArray:[dataSource fetchCellRegisterList]];
        }
    }
    return set;
}

/**< sectionHeader类名集合 注册用 */
- (NSSet *)sectionHeaderNameSet {
    NSMutableSet *set = [NSMutableSet set];
    NSArray *dataSourceArr = [WKModuleHandler supportableDataSourceList];
    for (NSString *className in dataSourceArr) {
        Class class = NSClassFromString(className);
        id<WKModuleSectionDataSourceProtocol> dataSource = [[class alloc] init];
        if ([dataSource respondsToSelector:@selector(fetchSectionHeaderReusableViewClassNameList)]) {
            [set addObjectsFromArray:[dataSource fetchSectionHeaderReusableViewClassNameList]];
        }
    }
    return set;
}

/**< sectionFooter类名集合 注册用 */
- (NSSet *)sectionFooterNameSet {
    NSMutableSet *set = [NSMutableSet set];
    NSArray *dataSourceArr = [WKModuleHandler supportableDataSourceList];
    for (NSString *className in dataSourceArr) {
        Class class = NSClassFromString(className);
        id<WKModuleSectionDataSourceProtocol> dataSource = [[class alloc] init];
        if ([dataSource respondsToSelector:@selector(fetchSectionFooterReusableViewClassNameList)]) {
            [set addObjectsFromArray:[dataSource fetchSectionFooterReusableViewClassNameList]];
        }
    }
    return set;
}

/** dataSource数组 */
- (NSMutableArray<id<WKModuleSectionDataSourceProtocol>> *)sectionDataSourceList {
    if (_sectionDataSourceList) {
        return _sectionDataSourceList;
    }
    _sectionDataSourceList = [NSMutableArray array];
    return _sectionDataSourceList;
}

@end
