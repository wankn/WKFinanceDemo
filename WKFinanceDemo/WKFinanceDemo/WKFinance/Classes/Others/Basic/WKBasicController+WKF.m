//
//  WKBasicController+WKF.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/2.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "WKBasicController+WKF.h"

@implementation WKBasicController (WKF)
- (void)wkhide_viewWillAppear:(BOOL)animated {
    if ([self isKindOfClass:[WKBasicController class]]) {
        if ([self respondsToSelector:@selector(hideNavigationBar)] && [(WKBasicController *)self hideNavigationBar]) {
//            [self.navigationController setNavigationBarHidden:YES animated:animated];
            self.navigationBar.hidden = YES;
        }
    }
}

- (void)wkhide_viewWillDisappear:(BOOL)animated {
    //判断是否是模态出来的控制器
    if (!self.navigationController.presentedViewController) {
        UIViewController *nextViewController = self.navigationController.viewControllers.lastObject;
        if ([nextViewController isKindOfClass:[WKBasicController class]]) {
            WKBasicController *vc = (WKBasicController *)nextViewController;
            if ([vc respondsToSelector:@selector(hideNavigationBar)]) {
                //如果下一个控制器也隐藏导航栏，导航栏不用重新设置
                if ([vc hideNavigationBar]) return;
            }
            //默认是重新设置导航栏的
//            [self.navigationController setNavigationBarHidden:NO animated:animated];
            self.navigationBar.hidden = NO;
        }
    }
}
@end
