//
//  WKBasicController.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKBasicController.h"
#import "WKFinanceConstant.h"
#import "UIViewController+WKHideNavigationBar.h"
#import "UIColor+WK.h"

@interface WKBasicController ()

@end

@implementation WKBasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor wk_bgColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self respondsToSelector:@selector(hideNavigationBar)]) {
        [self wkhide_viewWillAppear:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self wkhide_viewWillDisappear:animated];
}


@end
