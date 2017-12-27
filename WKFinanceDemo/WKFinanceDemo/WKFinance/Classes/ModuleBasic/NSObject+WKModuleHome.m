//
//  NSObject+WKModuleHome.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/27.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "NSObject+WKModuleHome.h"
#import "WKModuleConstant.h"

@implementation NSObject (WKModuleHome)

- (UIEdgeInsets)wk_sectionInsetsWithModuleSeparatorType:(NSInteger)separatorType {
    if (separatorType == WKModuleSeparatorTypeBottom) {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    } else if (separatorType == WKModuleSeparatorTypeTop) {
        return UIEdgeInsetsMake(10, 0, 0, 0);
    } else {
        return UIEdgeInsetsZero;
    }
}

@end
