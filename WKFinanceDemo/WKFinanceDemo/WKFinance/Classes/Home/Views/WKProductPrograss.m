//
//  WKProductPrograss.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKProductPrograss.h"

@interface WKProductPrograss()<CAAnimationDelegate>
@property (nonatomic, strong) CAShapeLayer *foregroundCircleLayer;
@property (nonatomic, strong) CAShapeLayer *backgroundCircleLayer;
@property (nonatomic, assign) CGFloat progressValue;

@property (nonatomic, assign) CGFloat animationDuration; /**< 动画持续时长 */
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel *percentLabel;
@property (nonatomic, assign) CGFloat foreRadius;
@property (nonatomic, assign) CGFloat foreLineWidth;
@end

@implementation WKProductPrograss

- (void)dealloc {
    [self invalidateTimer];
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    [self invalidateTimer];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self defaultSetup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self defaultSetup];
}

- (void)defaultSetup {
    self.foreRadius = 25;
    self.foreLineWidth = 5;
    self.animationDuration = 3;
    self.foreProgressColor = [UIColor redColor];
    self.backProgressColor = [UIColor lightGrayColor];
}

- (void)configureForeRadius:(CGFloat)foreRadius
              foreLineWidth:(CGFloat)foreLineWidth {
    self.foreRadius = foreRadius;
    self.foreLineWidth = foreLineWidth;
    [self initView];
}

- (void)updateProgressValue:(CGFloat)progress
                    animate:(BOOL)animate {
    self.percentLabel.frame = CGRectMake(0, 0, self.foreRadius * 2.0, self.foreRadius * 2.0);
    self.percentLabel.center = CGPointMake(CGRectGetWidth(self.bounds)/2.0, CGRectGetHeight(self.bounds)/2.0);
    self.progressValue = progress;
    [self.foregroundCircleLayer removeAllAnimations];
    if (animate) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @(0.0);
        animation.toValue = @(self.progressValue);
        animation.duration = self.animationDuration * self.progressValue;
        animation.removedOnCompletion = YES;
        animation.delegate = self;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        self.foregroundCircleLayer.strokeEnd = self.progressValue;
        [self.foregroundCircleLayer addAnimation:animation forKey:@"strokeEndAnimation"];
    } else {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
        [CATransaction setAnimationDuration:1];
        self.foregroundCircleLayer.strokeEnd = self.progressValue;
        [CATransaction commit];
    }
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    self.timer = [NSTimer timerWithTimeInterval:1/60.f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self invalidateTimer];
        self.percentLabel.text = [NSString stringWithFormat:@"%0.f%%",floorf(self.progressValue*100)];
    }
}

- (void)timerAction {
    id strokeEnd = [[self.foregroundCircleLayer presentationLayer] valueForKey:@"strokeEnd"];
    if (![strokeEnd isKindOfClass:[NSNumber class]]) {
        return;
    }
    CGFloat progress = [strokeEnd floatValue];
    self.percentLabel.text = [NSString stringWithFormat:@"%0.f%%",floorf(progress*100)];
}

#pragma mark - private methods
- (void)initView {
    [self addBackCircleWithSize:self.foreRadius lineWidth:self.foreLineWidth];
    [self addForeCircleWidthSize:self.foreRadius lineWidth:self.foreLineWidth];
    [self addSubview:self.percentLabel];
}

//添加背景的圆环
- (void)addBackCircleWithSize:(CGFloat)radius lineWidth:(CGFloat)lineWidth {
    self.backgroundCircleLayer = [self createShapeLayerWithSize:radius lineWith:lineWidth color:[UIColor grayColor]];
    self.backgroundCircleLayer.strokeStart = 0;
    self.backgroundCircleLayer.strokeEnd = 1;
    self.backgroundCircleLayer.strokeColor = self.backProgressColor.CGColor;
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
    self.foregroundCircleLayer.strokeColor = self.foreProgressColor.CGColor;
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

- (void)invalidateTimer {
    if (!self.timer) {
        return;
    }
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - setter
- (void)setBackProgressColor:(UIColor *)backProgressColor {
    _backProgressColor = backProgressColor;
    self.backgroundCircleLayer.strokeColor = backProgressColor.CGColor;
}

- (void)setForeProgressColor:(UIColor *)foreProgressColor {
    _foreProgressColor = foreProgressColor;
    self.foregroundCircleLayer.strokeColor = foreProgressColor.CGColor;
}

#pragma mark - getters
- (UILabel *)percentLabel {
    if (!_percentLabel) {
        _percentLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _percentLabel.textColor = [UIColor redColor];
        _percentLabel.font = [UIFont systemFontOfSize:14.f];
        _percentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _percentLabel;
}

@end
