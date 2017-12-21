//
//  UIView+WKLayout.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WKLayout)

- (void)wk_addTopSeparator:(BOOL)top
           bottomSeparator:(BOOL)bottom
                leftMargin:(CGFloat)left
               rightMargin:(CGFloat)right;

- (void)wk_addSpaceBottomSeparator;

- (void)wk_addBottomSeparator;

@end
