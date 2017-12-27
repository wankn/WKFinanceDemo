//
//  WKHomeTagsView.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeTagsView.h"
#import "masonry.h"
#import "NSString+WK.h"
#import "UILabel+WK.h"

@interface WKHomeTagsView()

@end

@implementation WKHomeTagsView

- (void)configureTags:(NSArray *)tags {
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    CGFloat originX = 0;
    for (NSString *tag in tags) {
        if (tag.length == 0) continue;
        UILabel *label = [self createTagLabel];
        label.text = tag;
        CGSize size = [tag wk_sizeWithFont:[UIFont systemFontOfSize:10.0f] constrainedToSize:CGSizeMake(MAXFLOAT, 15)];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(originX);
            make.size.mas_equalTo(CGSizeMake(size.width + 12, 15));
        }];
        originX += (size.width+12+5);
    }
}

- (UILabel *)createTagLabel {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:10.0f];
    label.backgroundColor = [UIColor redColor];
    label.layer.cornerRadius = 7.5f;
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
