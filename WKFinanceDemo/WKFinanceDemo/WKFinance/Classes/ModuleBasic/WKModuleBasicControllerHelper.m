//
//  WKModuleBasicControllerHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/21.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleBasicControllerHelper.h"
#import <SBLib/SBHttpDataLoader.h>

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

#pragma mark - SBHttpDataLoaderDelegate
- (void)dataLoader:(SBHttpDataLoader *)dataLoader onReceived:(DataItemResult *)result {
    if (dataLoader == self.configLoader) {
        if (!result.hasError) {
            if ([self respondsToSelector:@selector(fetchDataSourceListWithDataItemResult:)]) {
                NSArray *arr = [self fetchDataSourceListWithDataItemResult:result];
                [self.sectionDataSourceList removeAllObjects];
                [self.sectionDataSourceList addObjectsFromArray:arr];
            }
        }
    }
}

@end
