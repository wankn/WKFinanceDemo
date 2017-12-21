//
//  UIView+WKLayout.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "UIView+WKLayout.h"
#import "masonry.h"

@implementation UIView (WKLayout)
- (void)wk_addTopSeparator:(BOOL)top
           bottomSeparator:(BOOL)bottom
                leftMargin:(CGFloat)left
               rightMargin:(CGFloat)right {
    for (UIView *view in self.subviews) {
        if (view.tag == 444) {
            [view removeFromSuperview];
        }
    }
    UIView *lineView = [[UIView alloc] init];
    lineView.tag = 444;
    lineView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (top) {
            make.top.equalTo(self);
        } else if (bottom) {
            make.bottom.equalTo(self);
        }
        make.height.mas_equalTo(@0.5);
        make.left.equalTo(self).offset(left);
        make.right.equalTo(self).offset(-right);
    }];
}

- (void)wk_addSpaceBottomSeparator {
    [self wk_addTopSeparator:NO bottomSeparator:YES leftMargin:15 rightMargin:0];
}

- (void)wk_addBottomSeparator {
    [self wk_addTopSeparator:NO bottomSeparator:YES leftMargin:0 rightMargin:0];
}

@end
