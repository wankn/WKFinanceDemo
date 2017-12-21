//
//  WKHomeHttpProcess.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeHttpProcess.h"

@implementation WKHomeHttpProcess

+ (WKHomeHttpLoader *)requestHomeDataWithDelegate:(id<SBHttpDataLoaderDelegate>)delegate {
    
    NSString *urlString = @"https://api.jincaiwa.com/home/home2";
    NSString *httpMethod = @"POST";
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

@end
