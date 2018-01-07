//
//  WKWebViewController+WKF.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/5.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "WKWebViewController+WKF.h"
#import <objc/runtime.h>
#import "WKFinanceConstant.h"

@implementation WKWebViewController (WKF)






#pragma mark - setters and getters
- (void)setWk_progress:(UIProgressView *)wk_progress {
    objc_setAssociatedObject(self, @selector(wk_progress), wk_progress, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIProgressView *)wk_progress {
    UIProgressView *progress = objc_getAssociatedObject(self, _cmd);
    if (!progress) {
        progress = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 0)];
        progress.tintColor = RGB_HEX(0xff4400);
        progress.trackTintColor = [UIColor whiteColor];
    }
    return progress;
}


- (void)setWk_domainLabel:(UILabel *)wk_domainLabel {
    objc_setAssociatedObject(self, @selector(wk_domainLabel), wk_domainLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)wk_domainLabel {
    UILabel *label = objc_getAssociatedObject(self, _cmd);
    if (!label) {
        label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12.0f];
        label.textColor = [UIColor lightGrayColor];
        label.adjustsFontSizeToFitWidth = YES;
    }
    return label;
}

@end
