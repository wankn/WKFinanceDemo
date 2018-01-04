//
//  WKHomeHttpProcess.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKHomeHttpLoader.h"

@interface WKHomeHttpProcess : NSObject
/** 首页 */
+ (WKHomeHttpLoader *)requestHomeDataWithDelegate:(id<SBHttpDataLoaderDelegate>)delegate;

/** 理财 */
+ (WKHomeHttpLoader *)requestFinanceDataWithPageNo:(NSInteger)pageIndex
                                          pageSize:(NSInteger)pageSize
                                          delegate:(id<SBHttpDataLoaderDelegate>)delegate;

/** 产品详情 */ 
+ (WKHomeHttpLoader *)requestProductDetailWithProductId:(NSString *)productId
                                               delegate:(id<SBHttpDataLoaderDelegate>)delegate;


@end
