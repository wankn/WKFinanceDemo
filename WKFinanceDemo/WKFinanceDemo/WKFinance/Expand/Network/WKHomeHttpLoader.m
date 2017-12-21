//
//  WKHomeHttpLoader.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeHttpLoader.h"
#import "NSDictionary+WKRealValue.h"

@interface WKHomeHttpPaster()
+ (DataItemResult *)parseHomePageConfigData:(NSData *)data;
@end

@implementation WKHomeHttpPaster

+ (DataItemResult *)parseHomePageConfigData:(NSData *)data {
    DataItemResult *result = [[DataItemResult alloc]init];
    id httpJsonData = [NSJSONSerialization JSONObjectWithData:data
                                                      options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves
                                                        error:nil];
    if (httpJsonData == nil) {
        result.hasError = YES;
        result.message = @"数据解析异常，请稍后重试";
        return result;
    }
    if ([httpJsonData isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dataDict = [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)httpJsonData];
        NSDictionary *dic = [dataDict wk_dictionaryForKey:@"result"];
        result.resultInfo = [DataItemDetail detailFromDictionary:dic];
        if (![[dataDict wk_stringForKey:@"code"] isEqualToString:@"0"]) {
            result.hasError = YES;
            result.message = [dataDict wk_stringForKey:@"message"];
        }
    }
    return result;
}

@end

@implementation WKHomeHttpLoader
- (void)task:(SBHttpTask *)task onReceived:(NSData *)data {
    
    self.dataItemResult = [WKHomeHttpPaster parseHomePageConfigData:data];
    //结束一次请求
    [self onFinished];
}

- (void)task:(SBHttpTask *)task onError:(NSError *)error {
    
    self.dataItemResult = [[DataItemResult alloc]init];
    self.dataItemResult.message = [NSString stringWithFormat:@"网络不给力，请稍后重试(C410663:%zd)", error.code];
    self.dataItemResult.hasError = YES;
    
    [self onFinished];
}
@end


