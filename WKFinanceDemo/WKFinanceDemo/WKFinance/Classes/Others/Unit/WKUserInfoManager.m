//
//  WKUserManager.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKUserInfoManager.h"

@implementation WKUserInfoManager

+ (instancetype)defaultManager {
    static WKUserInfoManager *__manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __manager = [[WKUserInfoManager alloc] init];
    });
    return __manager;
}

+ (BOOL)hasLogin {
    return YES;
}


@end
