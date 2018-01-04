//
//  WKFProductDetailControllerHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "WKFProductDetailControllerHelper.h"
#import "WKHomeHttpProcess.h"

#import "WKFPorductDetailTopCellHelper.h"

@interface WKFProductDetailControllerHelper()<SBHttpDataLoaderDelegate>
@property (nonatomic, copy) NSString *productId;
@property (nonatomic, copy) NSString *navTitle;
@property (nonatomic, strong) NSMutableArray *cellHelperList; /**< cellHelper数组 */
@property (nonatomic, strong) SBHttpDataLoader *detailLoader;
@end

@implementation WKFProductDetailControllerHelper

- (void)dealloc {
    [self.detailLoader stopLoading];
    self.detailLoader = nil;
}

- (instancetype)initWithProductId:(NSString *)productId
                            title:(NSString *)title {
    if (self = [super init]) {
        self.productId = productId;
        self.navTitle = title;
    }
    return self;
}

#pragma mark - public methods
- (void)requestDetailData {
    [self.detailLoader stopLoading];
    self.detailLoader = [WKHomeHttpProcess requestProductDetailWithProductId:self.productId delegate:self];
}

#pragma mark - SBHttpDataLoaderDelegate
- (void)dataLoader:(SBHttpDataLoader *)dataLoader onReceived:(DataItemResult *)result {
    if (dataLoader == self.detailLoader) {
        if (!result.hasError) {
            [self loadCellHelperList:result];
        }
        if (self.requestDataFinishBlock) {
            self.requestDataFinishBlock(result.hasError, result.message);
        }
    }
}

#pragma mark - private methods
- (void)loadCellHelperList:(DataItemResult *)result {
    [self.cellHelperList removeAllObjects];
    WKFPorductDetailTopCellHelper *topHelper = [[WKFPorductDetailTopCellHelper alloc] init];
    [topHelper configureDetail:result.resultInfo];
    [self.cellHelperList addObject:topHelper];
}

#pragma mark - getters
- (NSMutableArray *)cellHelperList {
    if (!_cellHelperList) {
        _cellHelperList = [NSMutableArray array];
    }
    return _cellHelperList;
}

@end
