//
//  WKHomeControllerHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeControllerHelper.h"
#import "WKHomeHttpProcess.h"
#import "DataItemResult+WK.h"
#import "WKUserInfoManager.h"

@interface WKHomeControllerHelper()

@end

@implementation WKHomeControllerHelper


#pragma mark - WKModuleControllerHelperProtocol
- (SBHttpDataLoader *)fetchConfigLoader {
    SBHttpDataLoader *loader = [WKHomeHttpProcess requestHomeDataWithDelegate:self];
    return loader;
}

- (NSArray *)fetchDataSourceListWithDataItemResult:(DataItemResult *)result {
    return [self configureData:result];
}

- (NSArray *)configureData:(DataItemResult *)result {

    NSMutableArray *mutableArr = [NSMutableArray array];
    DataItemDetail *detail = result.resultInfo;
    //轮播图
    NSArray *bannerArr = [detail getArray:@"bannerList"];
    if (bannerArr.count > 0) {
        DataItemResult *tmpResult = [[DataItemResult alloc] init];
        [tmpResult wk_bulidResultWithArray:bannerArr];
        [tmpResult.resultInfo setObject:@(WKModuleTypeBanner) forKey:@"ModuleType"];
        [mutableArr addObject:tmpResult];
    }

    //公告
    NSArray *articleArr = [detail getArray:@"articleList"];
    if (articleArr.count > 0) {
        DataItemResult *tmpResult = [[DataItemResult alloc] init];
        [tmpResult wk_bulidResultWithArray:articleArr];
        [tmpResult.resultInfo setObject:@(WKModuleTypeRollPlatformNotice) forKey:@"ModuleType"];
        [mutableArr addObject:tmpResult];
    }

    //平台简介 + 安全保障
    DataItemResult *platResult = [[DataItemResult alloc] init];
    [platResult.resultInfo setObject:@(WKModuleTypePlatformIntro) forKey:@"ModuleType"];
    [mutableArr addObject:platResult];
    
    //新手广告图
    if (![WKUserInfoManager hasLogin]) {
        DataItemResult *tmpResult = [[DataItemResult alloc] init];
        NSDictionary *dic = @{@"NativeImageName":@"wk_module_newad"};
        DataItemDetail *tmpDetail = [DataItemDetail detailFromDictionary:dic];
        [tmpResult.resultInfo appendItems:tmpDetail];
        [tmpResult.resultInfo setObject:@(WKModuleTypeNewAd) forKey:@"ModuleType"];
        [mutableArr addObject:tmpResult];
    }
    
    //新手标
    NSArray *newProductList = [detail getArray:@"newProductList"];
    if (newProductList.count > 0) {
        
        DataItemResult *tmpResult = [[DataItemResult alloc] init];
        NSString *title = [detail getString:@"newTitle"];
        NSString *subTitle = [detail getString:@"newDescribe"];
        NSDictionary *dic = @{@"newTitle":title,@"newDescribe":subTitle};
        DataItemDetail *tmpDetail = [DataItemDetail detailFromDictionary:dic];
        [tmpResult.resultInfo appendItems:tmpDetail];
        [tmpResult wk_bulidResultWithArray:newProductList];
        [tmpResult.resultInfo setObject:@(WKModuleTypeNewUserProduct) forKey:@"ModuleType"];
        [mutableArr addObject:tmpResult];
    }

    if ([WKUserInfoManager hasLogin]) {
        //普通标
        NSArray *productList = [detail getArray:@"productList"];
        if (productList.count > 0) {
            DataItemResult *tmpResult = [[DataItemResult alloc] init];
            NSString *title = [detail getString:@"productTitle"];
            NSString *subTitle = [detail getString:@"productDescribe"];
            NSDictionary *dic = @{@"newTitle":title,@"newDescribe":subTitle};
            DataItemDetail *tmpDetail = [DataItemDetail detailFromDictionary:dic];
            [tmpResult.resultInfo appendItems:tmpDetail];
            [tmpResult wk_bulidResultWithArray:productList];
            [tmpResult.resultInfo setObject:@(WKModuleTypeProduct) forKey:@"ModuleType"];
            
            [mutableArr addObject:tmpResult];
        }
    }
    
    //底部提示
    DataItemResult *bottomResult = [[DataItemResult alloc] init];
    [bottomResult.resultInfo setObject:@(WKModuleTypeBottomTip) forKey:@"ModuleType"];
    [mutableArr addObject:bottomResult];
    
    return mutableArr;
}


@end
