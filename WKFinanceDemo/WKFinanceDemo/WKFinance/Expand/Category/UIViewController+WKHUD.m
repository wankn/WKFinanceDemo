//
//  UIViewController+WKHUD.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/4.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "UIViewController+WKHUD.h"

@implementation UIViewController (WKHUD)

/******************** 隐藏 ********************/
- (void)wk_hiddenTips {
    [self wk_hiddenTipsInView:[self delegateWindow]];
}

- (void)wk_hiddenTipsInView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:YES];
}

/******************** 显示 默认带转子 ********************/
- (void)wk_showTips:(NSString *)tips {
    [self wk_showTips:tips showIndicator:YES];
}

- (void)wk_showTips:(NSString *)tips inView:(UIView *)inView {
    [self wk_showTips:tips
               inView:inView
        showIndicator:YES
   hiddenAfterSeconds:0
           completion:nil];
}

- (void)wk_showTips:(NSString *)tips showIndicator:(BOOL)showIndicator {
    [self wk_showTips:tips showIndicator:showIndicator hiddenAfterSeconds:0];
}

- (void)wk_showTips:(NSString *)tips showIndicator:(BOOL)showIndicator inView:(UIView *)inView {
    [self wk_showTips:tips
               inView:inView
        showIndicator:showIndicator
   hiddenAfterSeconds:0
           completion:nil];
}

- (void)wk_showTips:(NSString *)tips hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds {
    [self wk_showTips:tips
        showIndicator:YES
   hiddenAfterSeconds:hiddenAfterSeconds];
}

- (void)wk_showTips:(NSString *)tips
 hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds
             inView:(UIView *)inView {
    [self wk_showTips:tips
               inView:inView
        showIndicator:YES
   hiddenAfterSeconds:hiddenAfterSeconds
           completion:nil];
}

- (void)wk_showTips:(NSString *)tips
      showIndicator:(BOOL)showIndicator
 hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds {
    [self wk_showTips:tips
               inView:[self delegateWindow]
        showIndicator:showIndicator
   hiddenAfterSeconds:hiddenAfterSeconds
           completion:nil];
}

- (void)wk_showTips:(NSString *)tips
      showIndicator:(BOOL)showIndicator
 hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds
             inView:(UIView *)inView {
    [self wk_showTips:tips
               inView:inView
        showIndicator:showIndicator
   hiddenAfterSeconds:hiddenAfterSeconds
           completion:nil];
}

/******************** 显示 自动消失 默认不带转子 ********************/
- (void)wk_showTipsAutoHidden:(NSString *)tips {
    [self wk_showTipsAutoHidden:tips inView:[self delegateWindow]];
}

- (void)wk_showTipsAutoHidden:(NSString *)tips
                       inView:(UIView *)inView {
    [self wk_showTipsAutoHidden:tips inView:inView completion:nil];
}

- (void)wk_showTipsAutoHidden:(NSString *)tips
                       inView:(UIView *)inView
                   completion:(void(^)(void))completion {
    [self wk_showTipsAutoHidden:tips
                  showIndicator:NO
                         inView:inView
                     completion:completion];
}

- (void)wk_showTipsAutoHidden:(NSString *)tips
                showIndicator:(BOOL)showIndicator
                       inView:(UIView *)inView
                   completion:(void(^)(void))completion {
    CGFloat seconds = tips.length / 10.0f;
    if (seconds > 3) {
        seconds = 3;
    } else if (seconds < 0.5) {
        seconds = 0.5;
    }
    [self wk_showTips:tips
               inView:inView
        showIndicator:showIndicator
   hiddenAfterSeconds:seconds
           completion:completion];
}

/******************** 显示 根方法 ********************/
- (void)wk_showTips:(NSString *)tips
             inView:(UIView *)inView
      showIndicator:(BOOL)showIndicator
 hiddenAfterSeconds:(CGFloat)hiddenAfterSeconds
         completion:(void(^)(void))completion {
    
    if (!inView) return;
    if (!tips || tips.length < 1) return;
    [self wk_hiddenTipsInView:inView];
    
    MBProgressHUD *hud = [MBProgressHUD HUDForView:inView];
    if (!hud) {
        hud = [self createHUDWithView:inView];
    }
    hud.detailsLabel.text = tips;
    if (!showIndicator) {
        hud.mode = MBProgressHUDModeText;
    }
    if (hiddenAfterSeconds > 0) {
        hud.minShowTime = 1.0f;
        [hud hideAnimated:YES afterDelay:hiddenAfterSeconds];
    }
    hud.completionBlock = completion;
}

- (MBProgressHUD *)createHUDWithView:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //    hud.bezelView.alpha = 0.7f;
    hud.defaultMotionEffectsEnabled = NO;
    hud.contentColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14.0f];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.label.textColor = [UIColor whiteColor];
    hud.label.font = [UIFont systemFontOfSize:17.0f];
    
    return hud;
}

- (UIWindow *)delegateWindow {
    return [[UIApplication sharedApplication].delegate window];
}

@end
