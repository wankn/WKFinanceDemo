//
//  WKNewUserProductCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKNewUserProductCellHelper.h"
#import "NSString+WK.h"

@interface WKNewUserProductCellHelper()
@property (nonatomic, strong) DataItemDetail *detail;

@property (nonatomic, copy) NSString *profit; /**< <#note#> */
@property (nonatomic, copy) NSString *investBegin;  /**< <#note#> */
@property (nonatomic, copy) NSString *descriptionText;  /**< <#note#> */
@property (nonatomic, copy) NSString *timeLimitValue;  /**< <#note#> */


@end

@implementation WKNewUserProductCellHelper

#pragma mark - WKModuleCellHelperProtocol
/** 绑定数据源 */
- (void)configureWithDataItemResult:(DataItemResult *)result {
    self.detail = result.resultInfo;
}

#pragma mark - getters
- (NSString *)profit {
    double tmp = [self.detail getString:@"profit"].doubleValue;
    return [NSString stringWithFormat:@"%.2f%%",tmp*100.0];
}

- (NSString *)investBegin {
    NSString *tmp = [[self.detail getString:@"investBegin"] wk_rejectLastZero];
    return [NSString stringWithFormat:@"起投金额  %@元",tmp];
}

- (NSString *)descriptionText {
    return [self.detail getString:@"description"];
}

- (NSString *)timeLimitValue {
    NSString *plstimeLimitValue =  [self.detail getString:@"plstimeLimitValue"];
    return [NSString stringWithFormat:@"投资期限  %@天",plstimeLimitValue];
}

@end
