//
//  WKWebViewController.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/28.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKWebViewController.h"
#import "Masonry.h"
#import "NSString+WK.h"

@interface WKWebViewController ()

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.wk_domainLabel];
    [self.view addSubview:self.htmlWebView];
    [self.view addSubview:self.wk_progress];
    
    [self.wk_domainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.insetTop + 10);
        make.left.width.equalTo(self.view);
        make.height.mas_equalTo(20.0f);
    }];
    [self.htmlWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(self.insetTop);
        make.left.right.bottom.equalTo(self.view);
    }];
    [self.wk_progress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(self.insetTop);
    }];
}

- (instancetype)initWithInteractionCenter:(WKWebViewInteractionCenter *)interactionCenter {
    if (self = [super init]) {
        self.interactionCenter = interactionCenter;
    }
    return self;
}


#pragma mark - private methods
- (CGFloat)insetTop {
    return 64;
}

- (void)startRequestHtml {
    
    self.urlString = [self.urlString trimBothSideSpaceCharacters];
    
}

#pragma mark - getters
- (WKWebView *)htmlWebView {
    if (!_htmlWebView) {
        _htmlWebView = [[WKWebView alloc] init];
        _htmlWebView.UIDelegate = self;
        _htmlWebView.navigationDelegate = self;
        _htmlWebView.backgroundColor = [UIColor clearColor];
        _htmlWebView.opaque = NO;
        for (UIView *subView in _htmlWebView.scrollView.subviews) {
            //设置背景色。因为如果_htmlWebView设置了背景色，providerLabel就无法显示出来
            if ([NSStringFromClass(subView.class) isEqualToString:@"WKContentView"]) {
                subView.backgroundColor = [UIColor whiteColor];
            }
        }
    }
}


@end
