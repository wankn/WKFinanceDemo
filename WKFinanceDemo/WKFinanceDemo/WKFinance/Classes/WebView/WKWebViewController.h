//
//  WKWebViewController.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/28.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKBasicController.h"
#import <WebKit/WebKit.h>
#import "WKWebViewInteractionCenter.h"
#import "WKWebViewController+WKF.h"

@interface WKWebViewController : WKBasicController<WKWebViewControllerPortocol,WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *htmlWebView;
@property (nonatomic, strong) WKWebViewInteractionCenter *interactionCenter;
@property (nonatomic, copy) NSString *urlString;


- (instancetype)initWithInteractionCenter:(WKWebViewInteractionCenter *)interactionCenter;

@end
