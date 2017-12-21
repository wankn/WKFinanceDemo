//
//  WKHomeControllerHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeControllerHelper.h"
//#import "WKHomeHttpProcess.h"
//#import "DataItemResult+WK.h"
//#import "WKCarouselBannerCellHelper.h"
//#import "WKVerticalCarouselCellHelper.h"
//#import "WKNewUserProductCellHelper.h"
//#import "WKHomeSafeCellHelper.h"
//#import "WKGeneralProductCellHelper.h"
//#import "WKHomeLargeTitleCellHelper.h"



@interface WKHomeControllerHelper()
//@property (nonatomic, strong) SBHttpDataLoader *homeDataLoader;
//@property (nonatomic, strong) NSMutableArray *cellHelperList;
//@property (nonatomic, strong) DataItemDetail *userDetail;
//@property (nonatomic, strong) DataItemDetail *generalDetail;
@end

@implementation WKHomeControllerHelper





//- (void)requestHomeData {
//    [self.homeDataLoader stopLoading];
//    self.homeDataLoader = [WKHomeHttpProcess requestHomeDataWithDelegate:self];
//}
//
//- (void)configureData:(DataItemResult *)result {
//
//    [self.cellHelperList removeAllObjects];
//    DataItemDetail *detail = result.resultInfo;
//    NSMutableArray *arr = [NSMutableArray array];
//    //轮播图
//    NSArray *bannerArr = [detail getArray:@"bannerList"];
//    if (bannerArr.count > 0) {
//        DataItemResult *tmpResult = [[DataItemResult alloc] init];
//        [tmpResult wk_bulidResultWithArray:bannerArr];
//        WKCarouselBannerCellHelper *helper = [WKCarouselBannerCellHelper helperWithDataItemResult:tmpResult];
//        [arr addObject:helper];
//    }
//
//    //公告
//    NSArray *articleArr = [detail getArray:@"articleList"];
//    if (articleArr.count > 0) {
//        DataItemResult *tmpResult = [[DataItemResult alloc] init];
//        [tmpResult wk_bulidResultWithArray:articleArr];
//        WKVerticalCarouselCellHelper *helper = [WKVerticalCarouselCellHelper helperWithDataItemResult:tmpResult];
//        [arr addObject:helper];
//    }
//    [self.cellHelperList addObject:arr];
//
//    //平台简介 + 安全保障
//    WKHomeSafeCellHelper *tmpHelper = [[WKHomeSafeCellHelper alloc] init];
//    [self.cellHelperList addObject:@[tmpHelper]];
//
//    //新手标
//    NSArray *newProductList = [detail getArray:@"newProductList"];
//    if (newProductList.count > 0) {
//        NSMutableArray *newProductListArr = [NSMutableArray array];
//        NSString *title = [detail getString:@"newTitle"];
//        NSString *subTitle = [detail getString:@"newDescribe"];
//        WKHomeLargeTitleCellHelper *titleCellHelper = [WKHomeLargeTitleCellHelper helperWithTitle:title subTitle:subTitle];
//        [newProductListArr addObject:titleCellHelper];
//        for (id obj in newProductList) {
//            if ([obj isKindOfClass:[NSDictionary class]]) {
//                DataItemDetail *tmpDetail = [DataItemDetail detailFromDictionary:obj];
//                WKNewUserProductCellHelper *helper = [WKNewUserProductCellHelper helperWithDataItemDetail:tmpDetail];
//                [newProductListArr addObject:helper];
//            }
//        }
//        [self.cellHelperList addObject:newProductListArr];
//    }
//
//    //普通标
//    NSArray *productList = [detail getArray:@"productList"];
//    if (productList.count > 0) {
//        NSMutableArray *productListArr = [NSMutableArray array];
//        for (id obj in productList) {
//            if ([obj isKindOfClass:[NSDictionary class]]) {
//                DataItemDetail *tmpDetail = [DataItemDetail detailFromDictionary:obj];
//                WKGeneralProductCellHelper *helper = [WKGeneralProductCellHelper helperWithDataItemDetail:tmpDetail];
//                [productListArr addObject:helper];
//            }
//        }
//        [self.cellHelperList addObject:productListArr];
//    }
//}
//
//#pragma mark - SBHttpDataLoaderDelegate
//- (void)dataLoader:(SBHttpDataLoader *)dataLoader onReceived:(DataItemResult *)result {
//    if (dataLoader == self.homeDataLoader) {
//        if (!result.hasError) {
//            [self configureData:result];
//        }
//        if (self.requestHomeDataFinishBlock) {
//            self.requestHomeDataFinishBlock(!result.hasError,result.message);
//        }
//    }
//}
//
//#pragma mark - getters
//- (NSMutableArray *)cellHelperList {
//    if (!_cellHelperList) {
//        _cellHelperList = [NSMutableArray array];
//    }
//    return _cellHelperList;
//}

@end
