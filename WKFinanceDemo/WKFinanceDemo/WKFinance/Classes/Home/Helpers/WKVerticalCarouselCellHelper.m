//
//  WKVerticalCarouselCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKVerticalCarouselCellHelper.h"

@interface WKVerticalCarouselCellHelper()
@property (nonatomic, strong) DataItemResult *result;
@property (nonatomic, strong) NSArray *titleList;
@end

@implementation WKVerticalCarouselCellHelper
+ (WKVerticalCarouselCellHelper *)helperWithDataItemResult:(DataItemResult *)result {
    return [[self alloc] initWithDataItemResult:result];
}

- (instancetype)initWithDataItemResult:(DataItemResult *)result {
    if (self = [super init]) {
        self.result = result;
    }
    return self;
}

#pragma mark -
- (NSArray *)titleList {
    NSMutableArray *arr = [NSMutableArray array];
    for (DataItemDetail *detail in self.result.dataList) {
        NSString *title = [detail getString:@"hotTitle"];
        [arr addObject:title];
    }
    return arr;
}

@end
