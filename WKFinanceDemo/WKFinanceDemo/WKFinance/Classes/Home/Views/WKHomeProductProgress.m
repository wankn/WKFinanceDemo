//
//  WKHomeProductProgress.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeProductProgress.h"
#import "masonry.h"

static CGFloat WKHomeProductProgressDotRadius = 5.0f;

@interface WKHomeProductProgress()
@property (nonatomic, strong) UIView *fullLine;      /**< 全部额度进度 */
@property (nonatomic, strong) UIView *progressLine;  /**< 当前额度进度 */
@property (nonatomic, strong) UIView *dotView;       /**< 当前额度的指示点 */
@property (nonatomic, strong) UILabel *percentLabel; /**< 百分比 */
@end

@implementation WKHomeProductProgress

- (void)awakeFromNib {
    [super awakeFromNib];
    [self createUI];
}

- (void)configureProgressValue:(NSString *)value {
    if (value.floatValue <= 1.0f) {
        [self.progressLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fullLine.mas_left);
            make.width.equalTo(self.fullLine.mas_width).multipliedBy(value.floatValue);
            make.centerY.equalTo(self);
            make.height.mas_equalTo(@2.0);
        }];
    }
}

- (void)createUI {
    [self addSubview:self.fullLine];
    [self addSubview:self.progressLine];
    [self addSubview:self.dotView];
    [self addSubview:self.percentLabel];
    
    [self.fullLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(WKHomeProductProgressDotRadius);
        make.right.equalTo(self).offset(-WKHomeProductProgressDotRadius);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(@2.0);
    }];
    [self.progressLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.fullLine.mas_left);
        make.width.equalTo(self.fullLine.mas_width).multipliedBy(1.0);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(@2.0);
    }];
    [self.dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(WKHomeProductProgressDotRadius*2.0, WKHomeProductProgressDotRadius*2.0));
        make.centerX.equalTo(self.progressLine.mas_right);
    }];
    [self.percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

#pragma mark - getters
- (UIView *)fullLine {
    if (!_fullLine) {
        _fullLine = [[UIView alloc] init];
        _fullLine.backgroundColor = [UIColor grayColor];
    }
    return _fullLine;
}

- (UIView *)progressLine {
    if (!_progressLine) {
        _progressLine = [[UIView alloc] init];
        _progressLine.backgroundColor = [UIColor redColor];
    }
    return _progressLine;
}

- (UIView *)dotView {
    if (!_dotView) {
        _dotView = [[UIView alloc] init];
        _dotView.backgroundColor = [UIColor redColor];
        _dotView.layer.cornerRadius = WKHomeProductProgressDotRadius;
        _dotView.layer.borderWidth = WKHomeProductProgressDotRadius * 0.5;
        _dotView.layer.borderColor = [UIColor orangeColor].CGColor;
        _dotView.layer.masksToBounds = YES;
    }
    return _dotView;
}

- (UILabel *)percentLabel {
    if (!_percentLabel) {
        _percentLabel = [[UILabel alloc] init];
        _percentLabel.font = [UIFont systemFontOfSize:12.0f];
    }
    return _percentLabel;
}

@end
