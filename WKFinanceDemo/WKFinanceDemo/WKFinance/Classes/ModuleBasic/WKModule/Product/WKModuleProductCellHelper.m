//
//  WKModuleProductCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleProductCellHelper.h"
#import "NSString+WK.h"

@interface WKModuleProductCellHelper()
@property (nonatomic, strong) DataItemDetail *detail;
@end

@implementation WKModuleProductCellHelper

#pragma mark - WKModuleCellHelperProtocol
/** 绑定数据源 */
- (void)configureWithDataItemResult:(DataItemResult *)result {
    self.detail = result.resultInfo;
}

#pragma mark - getters
- (NSString *)title {
    return [self.detail getString:@"title"];
}

- (NSAttributedString *)profitAttributedString {
    double profit = [[self.detail getString:@"profit"] doubleValue];
    NSString *profitStr = [NSString stringWithFormat:@"%.2f",profit*100];
    double profitFloat = [[self.detail getString:@"profitFloat"] doubleValue];
    NSString *profitText = profitStr;
    if (profitFloat > 0) {
        profitText = [NSString stringWithFormat:@"%@%%+%.2f%%",profitStr,profitFloat*100];
    }
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:profitText];
    [att addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25.0f]} range:NSMakeRange(0, profitStr.length)];
    return att;
}

- (NSAttributedString *)timeLimitValue {
    NSString *time = [NSString stringWithFormat:@"%@天",[self.detail getString:@"plstimeLimitValue"]];
    NSString *prefixStr = @"投资期限：";
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",prefixStr,time]];
    [att addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, prefixStr.length)];
    return att;
}

- (NSString *)investBegin {
    return [NSString stringWithFormat:@"起投%@元",[[self.detail getString:@"investBegin"] wk_rejectLastZero]];
}

- (NSAttributedString *)surplusAmount {
    double amount = [self.detail getString:@"surplusAmount"].doubleValue;
    NSString *surplusString = nil;
    if (amount > 10000.0) {
        surplusString = [NSString stringWithFormat:@"%.2f万元",amount/10000.0];
    } else if (amount == 0) {
        surplusString = [NSString stringWithFormat:@"0元"];
    } else {
        surplusString = [NSString stringWithFormat:@"%.2f元",amount];
    }
    NSString *prefixStr = @"剩余可投：";
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",prefixStr,surplusString]];
    [attr addAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, prefixStr.length)];
    return attr;
}

- (NSArray *)tags {
    NSString *tagsStr = [self.detail getString:@"tags"];
    NSArray *arr = [tagsStr componentsSeparatedByString:@","];
    return arr;
}

- (NSString *)investPercent {
    return [self.detail getString:@"investPercent"];
}

- (NSDictionary *)linkParams {
    NSString *productid = [self.detail getString:@"productsId"];
    NSString *description = [self.detail getString:@"description"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:productid forKey:@"productid"];
    [dic setValue:description forKey:@"description"];
    return dic;
}


@end
