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
        UILabel *label = [UILabel wk_tagLabelWithText:tag];
        CGSize size = [tag wk_sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(MAXFLOAT, 15)];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(originX);
            make.size.mas_equalTo(CGSizeMake(size.width + 5, size.height + 2));
        }];
        originX += (size.width+10);
    }
}

@end
