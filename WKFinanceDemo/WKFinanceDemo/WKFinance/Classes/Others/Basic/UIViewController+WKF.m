//
//  UIViewController+WKF.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "UIViewController+WKF.h"
#import "Masonry.h"

@implementation UIViewController (WKF)
- (void)wkf_layoutView:(UIView *)layoutView forNavigationBar:(UIView *)navBar {
    if (navBar.hidden) {
        [layoutView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(layoutView.superview);
        }];
    } else {
        [layoutView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(navBar.mas_bottom);
            make.left.right.bottom.equalTo(layoutView.superview);
        }];
    }
}
@end
