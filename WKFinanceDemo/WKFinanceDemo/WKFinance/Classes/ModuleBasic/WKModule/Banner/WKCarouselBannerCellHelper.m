//
//  WKCarouselBannerCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKCarouselBannerCellHelper.h"
#import "WKModuleBasicProtocol.h"

@interface WKCarouselBannerCellHelper()
@property (nonatomic, strong) DataItemResult *result;
@property (nonatomic, strong) NSArray *imagesUrlList;
@end

@implementation WKCarouselBannerCellHelper


#pragma mark - WKModuleCellHelperProtocol
/** 绑定数据源 */
- (void)configureWithDataItemResult:(DataItemResult *)result {
    self.result = result;
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
