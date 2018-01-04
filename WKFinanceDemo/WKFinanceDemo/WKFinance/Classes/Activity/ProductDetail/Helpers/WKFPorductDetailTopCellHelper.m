//
//  WKFPorductDetailTopCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "WKFPorductDetailTopCellHelper.h"

@interface WKFPorductDetailTopCellHelper()
@property (nonatomic, strong) DataItemDetail *detail;
@end

@implementation WKFPorductDetailTopCellHelper

- (void)configureDetail:(DataItemDetail *)detail {
    self.detail = detail;
}

#pragma mark - getters
- (NSAttributedString *)yieldText {
    double profit = [self.detail getString:@"profit"].doubleValue;
    NSString *profitStr = [NSString stringWithFormat:@"%.2f",profit*100];
    double profitFloat = [self.detail getString:@"profitFloat"].doubleValue;
    NSString *profitText = profitStr;
    if (profitFloat > 0) {
        profitText = [NSString stringWithFormat:@"%@%%+%.2f%%",profitStr,profitFloat*100];
    }
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:profitText];
    [att addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25.0f]} range:NSMakeRange(0, profitStr.length)];
    return att;
}

- (NSString *)yieldDesText {
    return @"历史年化收益率";
}

- (NSArray *)tags {
    NSString *tagsStr = [self.detail getString:@"tags"];
    NSArray *arr = [tagsStr componentsSeparatedByString:@","];
    return arr;
}

- (NSAttributedString *)plstimeLimitValue {
    NSString *time = [self.detail getString:@"plstimeLimitValue"];
    time = [NSString stringWithFormat:@"%@天",time];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:time];
    [att addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} range:NSMakeRange(time.length-1, 1)];
    return att;
}

- (NSString *)plstimeLimitValueDes {
    return @"投资期限";
}

- (NSAttributedString *)surplusAmount {
    double surplus = [self.detail getString:@"surplusAmount"].doubleValue;
    NSString *amount = [NSString stringWithFormat:@"%.2f万",surplus/10000.0];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:amount];
    [att addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} range:NSMakeRange(amount.length-1, 1)];
    return att;
}

- (NSString *)surplusAmountDes {
    return @"剩余金额";
}

- (NSAttributedString *)productsScale {
    double scale = [self.detail getString:@"productsScale"].doubleValue;
    NSString *scaleText = [NSString stringWithFormat:@"%.2f万",scale/10000.0];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:scaleText];
    [att addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} range:NSMakeRange(scaleText.length-1, 1)];
    return att;
}

- (NSString *)productsScaleDes {
    return @"项目总额";
}


@end
