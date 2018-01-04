//
//  WKFProductDetailControllerHelper.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKFProductDetailControllerHelper : NSObject

@property (nonatomic, readonly) NSString *navTitle; /**< 导航栏标题 */
@property (nonatomic, readonly) NSMutableArray *cellHelperList; /**< cellHelper数组 */
@property (nonatomic, copy) void(^requestDataFinishBlock)(BOOL hasError,NSString *message);


- (instancetype)initWithProductId:(NSString *)productId
                            title:(NSString *)title;

- (void)requestDetailData;

@end
