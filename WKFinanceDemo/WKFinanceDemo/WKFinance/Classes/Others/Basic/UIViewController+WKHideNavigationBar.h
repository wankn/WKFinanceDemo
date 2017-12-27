//
//  UIViewController+WKHideNavigationBar.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/27.
//  Copyright © 2017年 wangkun. All rights reserved.
//  隐藏导航栏

#import <UIKit/UIKit.h>

@interface UIViewController (WKHideNavigationBar)
- (void)wkhide_viewWillAppear:(BOOL)animated;
- (void)wkhide_viewWillDisappear:(BOOL)animated;
@end
