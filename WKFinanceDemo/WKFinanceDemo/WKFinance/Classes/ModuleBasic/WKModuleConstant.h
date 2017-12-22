//
//  WKModuleConstant.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>


/** 卡片模块样式 */
typedef NS_ENUM(NSInteger, WKModuleType) {
    
    WKModuleTypeBanner = 1,              //轮播图
    WKModuleTypeRollPlatformNotice = 2,  //滚动平台公告
    WKModuleTypePlatformIntro = 3,       //平台简介
    WKModuleTypeNewUserProduct = 4,      //新手
    WKModuleTypeProduct = 5,             //标的
};



@interface WKModuleConstant : NSObject

@end
