//
//  WKModuleHandler.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleHandler.h"

@implementation WKModuleHandler

+ (NSString *)dataSourceClassNameWithModuleType:(WKModuleType)moduleType {
    switch (moduleType) {
        case WKModuleTypeBanner:
            return @"WKModuleBannerDataSource";
            break;
        case WKModuleTypeRollPlatformNotice:
            return @"WKModuleRollPlatformNoticeDataSource";
            break;
        case WKModuleTypePlatformIntro:
            return @"WKModulePlatformIntroDataSource";
            break;
        case WKModuleTypeNewUserProduct:
            return @"WKModuleNewUserProductDataSource";
            break;
        case WKModuleTypeProduct:
            return @"WKModuleProductDataSource";
            break;
        default:
            break;
    }
    return nil;
}


+ (NSArray *)supportableDataSourceList {
    return @[@"WKModuleBannerDataSource",
             @"WKModuleRollPlatformNoticeDataSource",
             @"WKModulePlatformIntroDataSource",
             @"WKModuleNewUserProductDataSource",
             @"WKModuleProductDataSource"];
}


@end
