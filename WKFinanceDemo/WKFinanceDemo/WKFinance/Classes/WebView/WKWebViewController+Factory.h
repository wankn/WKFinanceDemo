//
//  WKWebViewController+Factory.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/28.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKWebViewController.h"

@interface WKWebViewController (Factory)

+ (WKWebViewController *)webViewControllerWithUrl:(NSString *)url;

@end
