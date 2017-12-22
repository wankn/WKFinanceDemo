//
//  WKModuleTitleReusableView.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleTitleReusableView.h"
#import "Masonry.h"
#import "UIView+WKLayout.h"

@interface WKModuleTitleReusableView()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation WKModuleTitleReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self).offset(15);
            make.height.mas_equalTo(@20);
            make.right.equalTo(self).offset(-15);
        }];
        [self wk_addBottomSeparator];
    }
    return self;
}

- (void)configureTitle:(NSString *)title {
    self.titleLabel.text = title;
}

#pragma mark - getters
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    }
    return _titleLabel;
}

@end
