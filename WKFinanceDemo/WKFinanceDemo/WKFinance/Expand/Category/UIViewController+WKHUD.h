//
//  UIViewController+WKHUD.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/4.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIViewController (WKHUD)

/******************** 隐藏 ********************/
- (void)wk_hiddenTips;
- (void)wk_hiddenTipsInView:(UIView *)view;

/******************** 显示 默认带转子 ********************/
- (void)wk_showTips:(NSString *)tips;
- (void)wk_showTips:(NSString *)tips inView:(UIView *)inView;
- (void)wk_showTips:(NSString *)tips showIndicator:(BOOL)showIndicator;
- (void)wk_showTips:(NSString *)tips showIndicator:(BOOL)showIndicator inView:(UIView *)inView;
- (void)wk_showTips:(NSString *)tips hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds;
- (void)wk_showTips:(NSString *)tips hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds inView:(UIView *)inView;
- (void)wk_showTips:(NSString *)tips
      showIndicator:(BOOL)showIndicator
 hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds;
- (void)wk_showTips:(NSString *)tips
      showIndicator:(BOOL)showIndicator
 hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds
             inView:(UIView *)inView;

/******************** 显示 自动消失 默认不带转子 ********************/
- (void)wk_showTipsAutoHidden:(NSString *)tips;
- (void)wk_showTipsAutoHidden:(NSString *)tips
                       inView:(UIView *)inView;
- (void)wk_showTipsAutoHidden:(NSString *)tips
                       inView:(UIView *)inView
                   completion:(void(^)(void))completion;
- (void)wk_showTipsAutoHidden:(NSString *)tips
                showIndicator:(BOOL)showIndicator
                       inView:(UIView *)inView
                   completion:(void(^)(void))completion;

/******************** 显示 根方法 ********************/
- (void)wk_showTips:(NSString *)tips
             inView:(UIView *)inView
      showIndicator:(BOOL)showIndicator
 hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds
         completion:(void(^)(void))completion;


@end
