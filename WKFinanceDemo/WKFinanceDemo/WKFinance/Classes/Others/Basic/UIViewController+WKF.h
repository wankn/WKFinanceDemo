//
//  UIViewController+WKF.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (WKF)

/** 重设置主界面view的布局 */
- (void)wkf_layoutView:(UIView *)layoutView forNavigationBar:(UIView *)navBar;

@end
