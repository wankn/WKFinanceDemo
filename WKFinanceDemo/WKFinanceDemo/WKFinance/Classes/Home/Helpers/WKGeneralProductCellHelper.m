//
//  WKGeneralProductCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKGeneralProductCellHelper.h"
#import "NSString+WK.h"

@interface WKGeneralProductCellHelper()
@property (nonatomic, strong) DataItemDetail *detail;
@end

@implementation WKGeneralProductCellHelper
+ (WKGeneralProductCellHelper *)helperWithDataItemDetail:(DataItemDetail *)detail {
    return [[self alloc] initWithDataItemDetail:detail];
}

- (instancetype)initWithDataItemDetail:(DataItemDetail *)detail {
    if (self = [super init]) {
        self.detail = detail;
    }
    return self;
}

#pragma mark -
- (NSString *)title {
    return [self.detail getString:@"title"];
}

- (NSAttributedString *)profitAttributedString {
    double profit = [[self.detail getString:@"profit"] doubleValue];
    NSString *profitStr = [NSString stringWithFormat:@"%.2f",profit];
    double profitFloat = [[self.detail getString:@"profitFloat"] doubleValue];
    NSString *profitText = [NSString stringWithFormat:@"%@%%+%.2f%%",profitStr,profitFloat];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:profitText];
    [att addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25.0f]} range:NSMakeRange(0, profitStr.length)];
    return att;
}

- (NSAttributedString *)timeLimitValue {
    NSString *time = [NSString stringWithFormat:@"%@天",[self.detail getString:@"plstimeLimitValue"]];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:time];
    [att addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} range:NSMakeRange(time.length - 1, 1)];
    return att;
}

- (NSString *)investBegin {
    return [NSString stringWithFormat:@"起投%@元",[[self.detail getString:@"investBegin"] wk_rejectLastZero]];
}

- (NSString *)surplusAmount {
    double amount = [self.detail getString:@"surplusAmount"].doubleValue;
    if (amount > 10000.0) {
        return [NSString stringWithFormat:@"剩余%.2f万元",amount/10000.0];
    }
    if (amount == 0) {
        return [NSString stringWithFormat:@"剩余0元"];
    }
    return [NSString stringWithFormat:@"剩余%.2f元",amount];
}

- (NSArray *)tags {
    NSString *tagsStr = [self.detail getString:@"tags"];
    NSArray *arr = [tagsStr componentsSeparatedByString:@","];
    return arr;
}

- (NSString *)investPercent {
    return [self.detail getString:@"investPercent"];
}

@end
