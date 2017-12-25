//
//  WKProductPrograss.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKProductPrograss : UIView

@property (nonatomic, strong) CAShapeLayer *foregroundCircleLayer;
@property (nonatomic, strong) CAShapeLayer *backgroundCircleLayer;
@property (nonatomic, assign) CGFloat progressValue;

- (instancetype)initWithFrame:(CGRect)frame
                   foreRadius:(CGFloat)foreRadius
                foreLineWidth:(CGFloat)foreLineWidth
                   backRadius:(CGFloat)backRadius
                backLineWidth:(CGFloat)backLineWidth;

- (void)configureForeRadius:(CGFloat)foreRadius
              foreLineWidth:(CGFloat)foreLineWidth
                 backRadius:(CGFloat)backRadius
              backLineWidth:(CGFloat)backLineWidth;

@end
