//
//  WKHomeHttpProcess.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeHttpProcess.h"
#import <SBLib/NSDictionary+SBMODULE.h>

@implementation WKHomeHttpProcess

+ (WKHomeHttpLoader *)requestHomeDataWithDelegate:(id<SBHttpDataLoaderDelegate>)delegate {
    
    NSString *urlString = @"https://api.jincaiwa.com/home/home2";
    NSString *httpMethod = @"POST";
    return [self requestWithUrl:urlString httpMethod:httpMethod delegate:delegate];
}

+ (WKHomeHttpLoader *)requestFinanceDataWithPageNo:(NSInteger)pageNo
                                          pageSize:(NSInteger)pageSize
                                          delegate:(id<SBHttpDataLoaderDelegate>)delegate {
    NSString *urlString = @"https://api.jincaiwa.com/products/productsList";
    NSString *httpMethod = @"POST";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@(pageSize) forKey:@"pageSize"];
    [params setValue:@(pageNo) forKey:@"pageNo"];
    NSString *urlStr = [self fetchFullUrlWithUrlString:urlString params:params];
    return [self requestWithUrl:urlStr httpMethod:httpMethod delegate:delegate];
}

/** 产品详情 */
+ (WKHomeHttpLoader *)requestProductDetailWithProductId:(NSString *)productId
                                               delegate:(id<SBHttpDataLoaderDelegate>)delegate {
    NSString *urlString = @"https://api.jincaiwa.com/products/details";
    NSString *httpMethod = @"POST";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:productId forKey:@"id"];
    NSString *urlStr = [self fetchFullUrlWithUrlString:urlString params:params];
    return [self requestWithUrl:urlStr httpMethod:httpMethod delegate:delegate];
}

#pragma mark - private methods
+ (WKHomeHttpLoader *)requestWithUrl:(NSString *)urlString httpMethod:(NSString *)httpMethod delegate:(id<SBHttpDataLoaderDelegate>)delegate {
    //保证在主线程请求
    __block WKHomeHttpLoader *loader = nil;
    if ([NSThread currentThread] != [NSThread mainThread]){
        dispatch_sync(dispatch_get_main_queue(), ^{
            loader = [[WKHomeHttpLoader alloc]initWithURL:urlString httpMethod:httpMethod delegate:delegate];
        });
    } else {
        loader = [[WKHomeHttpLoader alloc]initWithURL:urlString httpMethod:httpMethod delegate:delegate];
    }
    return loader;
}

+ (NSString *)fetchFullUrlWithUrlString:(NSString *)urlString params:(NSDictionary *)params {
    NSString *paramsString = [params sb_URLArgumentsString];
    NSString *urlStr = nil;
    if ([urlString rangeOfString:@"?"].location != NSNotFound) {
        urlStr = [urlString stringByAppendingString:@"&"];
    } else {
        urlStr = [urlString stringByAppendingString:@"?"];
    }
    urlStr = [urlStr stringByAppendingString:paramsString];
    return urlStr;
}

@end
