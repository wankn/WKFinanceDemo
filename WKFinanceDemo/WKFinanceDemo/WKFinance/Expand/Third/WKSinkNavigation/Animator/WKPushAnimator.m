//
//  WKPushAnimator.m
//
//  Created by 王昆 on 16/11/16.
//  Copyright © 2016年 wangkun. All rights reserved.
//

#import "WKPushAnimator.h"
#import "WKSinkNavigationControllerConst.h"

@interface WKPushAnimator ()
@property (nonatomic, strong) UIView *blackMask;
@end

@implementation WKPushAnimator

#pragma mark - UIViewControllerAnimatedTransitioning
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //目标控制器
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //源控制器
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //控制器栈
    UIView *container = [transitionContext containerView];
    //入栈
    [container addSubview:toVc.view];
    
    toVc.view.wk_x = WKScreenWidth;
    
    UIView *blackMask = [[UIView alloc] init];
    self.blackMask = blackMask;
    blackMask.backgroundColor = [UIColor blackColor];
    blackMask.frame = CGRectMake(0, 0, WKScreenWidth, WKScreenHeight);
    blackMask.alpha = 0;
    [container insertSubview:self.blackMask aboveSubview:fromVc.view];
    
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:self.duration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        // 动画效果
        float scale = WKSinkNavigationControllerLastScreenShotScale;
        fromVc.view.transform = CGAffineTransformMakeScale(scale, scale);
        toVc.view.wk_x = 0;
        weakSelf.blackMask.alpha = WKSinkNavigationControllerBlackMaskAlpha;
        
    } completion:^(BOOL finished) {
        
        fromVc.view.transform = CGAffineTransformIdentity;
        [weakSelf.blackMask removeFromSuperview];
//        [container addSubview:fromVc.view];
//        [container addSubview:toVc.view];
        //如果遇到未知取消操作恢复栈结构
        if (transitionContext.transitionWasCancelled) {
            [toVc.view removeFromSuperview];
        }
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
