//
//  WKProductPrograss.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKProductPrograss.h"

@interface WKProductPrograss()
@property (nonatomic, assign) CGFloat foreRadius;
@property (nonatomic, assign) CGFloat foreLineWidth;
@property (nonatomic, assign) CGFloat backRadius;
@property (nonatomic, assign) CGFloat backLineWidth;
@end

@implementation WKProductPrograss

- (instancetype)initWithFrame:(CGRect)frame
                   foreRadius:(CGFloat)foreRadius
                foreLineWidth:(CGFloat)foreLineWidth
                   backRadius:(CGFloat)backRadius
                backLineWidth:(CGFloat)backLineWidth {
    if (self = [super initWithFrame:frame]) {
        [self configureForeRadius:foreRadius foreLineWidth:foreLineWidth backRadius:backRadius backLineWidth:backLineWidth];
    }
    return self;
}

- (void)configureForeRadius:(CGFloat)foreRadius
              foreLineWidth:(CGFloat)foreLineWidth
                 backRadius:(CGFloat)backRadius
              backLineWidth:(CGFloat)backLineWidth {
    self.foreRadius = foreRadius;
    self.foreLineWidth = foreLineWidth;
    self.backRadius = backRadius;
    self.backLineWidth = backLineWidth;
    [self initView];
}

- (void)initView {
    [self addBackCircleWithSize:self.backRadius lineWidth:self.backLineWidth];
    [self addForeCircleWidthSize:self.foreRadius lineWidth:self.foreLineWidth];
}

//添加背景的圆环
- (void)addBackCircleWithSize:(CGFloat)radius lineWidth:(CGFloat)lineWidth {
    self.backgroundCircleLayer = [self createShapeLayerWithSize:radius lineWith:lineWidth color:[UIColor grayColor]];
    self.backgroundCircleLayer.strokeStart = 0;
    self.backgroundCircleLayer.strokeEnd = 1;
    self.backgroundCircleLayer.strokeColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:0.3].CGColor;
    [self.layer addSublayer:self.backgroundCircleLayer];
}

//前面的圆环
- (void)addForeCircleWidthSize:(CGFloat)radius lineWidth:(CGFloat)lineWidth {
    self.foregroundCircleLayer = [self createShapeLayerWithSize:radius lineWith:lineWidth color:[UIColor greenColor]];
    
    self.foregroundCircleLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                          radius:radius-lineWidth/2
                                                      startAngle:-M_PI/2
                                                        endAngle:M_PI/180*270
                                                       clockwise:YES].CGPath;
    self.foregroundCircleLayer.strokeStart = 0;
    self.foregroundCircleLayer.strokeEnd = 0.8;
    self.foregroundCircleLayer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:self.foregroundCircleLayer];
}

//创建圆环
- (CAShapeLayer *)createShapeLayerWithSize:(CGFloat)radius
                                  lineWith:(CGFloat)lineWidth
                                     color:(UIColor *)color {
    CGRect foreCircle_frame = CGRectMake(self.bounds.size.width/2-radius,
                                         self.bounds.size.height/2-radius,
                                         radius*2,
                                         radius*2);
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = foreCircle_frame;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                        radius:radius-lineWidth/2
                                                    startAngle:0
                                                      endAngle:M_PI*2
                                                     clockwise:YES];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.backgroundColor = [UIColor clearColor].CGColor;
    layer.strokeColor = color.CGColor;
    layer.lineWidth = lineWidth;
    layer.lineCap = @"round";
    
    return layer;
}

#pragma mark - setter
- (void)setProgressValue:(CGFloat)progressValue{
    if (self.foregroundCircleLayer) {
        self.foregroundCircleLayer.strokeEnd = progressValue;
    }
}



@end
