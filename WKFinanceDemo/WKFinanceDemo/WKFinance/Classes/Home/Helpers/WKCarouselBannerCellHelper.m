//
//  WKCarouselBannerCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKCarouselBannerCellHelper.h"

@interface WKCarouselBannerCellHelper()
@property (nonatomic, strong) DataItemResult *result;
@property (nonatomic, strong) NSArray *imagesUrlList;
@end

@implementation WKCarouselBannerCellHelper

+ (WKCarouselBannerCellHelper *)helperWithDataItemResult:(DataItemResult *)result {
    return [[self alloc] initWithDataItemResult:result];
}

- (instancetype)initWithDataItemResult:(DataItemResult *)result {
    if (self = [super init]) {
        self.result = result;
    }
    return self;
}

#pragma mark - getters
- (NSArray *)imagesUrlList {
    NSMutableArray *arr = [NSMutableArray array];
    for (DataItemDetail *detail in self.result.dataList) {
        NSString *imageUrl = [detail getString:@"bannerImgae"];
        [arr addObject:imageUrl];
    }
    return arr;
}


@end
