//
//  WKModuleConstant.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const WKModuleTypeKey;      //moduleType字段
extern NSString * const WKModuleSeparatorTypeKey; //moduleSeparatorType字段

/** 卡片模块样式 */
typedef NS_ENUM(NSInteger, WKModuleType) {
    
    WKModuleTypeBanner = 1,              //轮播图
    WKModuleTypeRollPlatformNotice = 2,  //滚动平台公告
    WKModuleTypePlatformIntro = 3,       //平台简介
    WKModuleTypeNewUserProduct = 4,      //新手
    WKModuleTypeProduct = 5,             //标的
    WKModuleTypeNewAd = 6,               //广告图
    WKModuleTypeBottomTip = 7            //底部提示
};

/** 卡片模块分隔条 */
typedef NS_ENUM(NSInteger, WKModuleSeparatorType) {
    WKModuleSeparatorTypeNone = 0,   //没有分割条
    WKModuleSeparatorTypeBottom = 1, //下分割条
    WKModuleSeparatorTypeTop = 2     //上分割条 还没支持
};

@interface WKModuleConstant : NSObject

@end
