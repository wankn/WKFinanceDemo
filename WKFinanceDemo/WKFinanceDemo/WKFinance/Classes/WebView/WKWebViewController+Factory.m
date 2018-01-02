//
//  WKWebViewController+Factory.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/28.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKWebViewController+Factory.h"

@implementation WKWebViewController (Factory)

+ (WKWebViewController *)webViewControllerWithUrl:(NSString *)url {
    WKWebViewController *webVC = [[WKWebViewController alloc] init];
    return webVC;
}

@end
