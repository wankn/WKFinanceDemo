//
//  UILabel+WK.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "UILabel+WK.h"

@implementation UILabel (WK)

+ (UILabel *)wk_tagLabelWithText:(NSString *)text {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    label.layer.cornerRadius = 2;
    label.layer.masksToBounds = YES;
    return label;
}

@end
