//
//  WKProductPrograss.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKProductPrograss : UIView

@property (nonatomic, readonly) CAShapeLayer *foregroundCircleLayer;
@property (nonatomic, readonly) CAShapeLayer *backgroundCircleLayer;
@property (nonatomic, readonly) CGFloat progressValue;

@property (nonatomic, strong) UIColor *backProgressColor; /**< 底部进度条颜色 */
@property (nonatomic, strong) UIColor *foreProgressColor; /**< 顶部进度条颜色 */

//@property (nonatomic, strong) UIColor *foreGradientBeginColor;  /**< 渐变开始色 */
//@property (nonatomic, strong) UIColor *foreGradientMiddleColor; /**< 渐变中间色 */
//@property (nonatomic, strong) UIColor *foreGradientEndColor;    /**< 渐变结束色 */

- (void)configureForeRadius:(CGFloat)foreRadius
              foreLineWidth:(CGFloat)foreLineWidth;

- (void)updateProgressValue:(CGFloat)progress
                    animate:(BOOL)animate;

@end
