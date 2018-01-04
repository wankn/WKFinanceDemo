//
//  WKFProductDetailController+Factory.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "WKFProductDetailController+Factory.h"

@implementation WKFProductDetailController (Factory)
+ (WKFProductDetailController *)productDetailControllerWithProductId:(NSString *)productId
                                                               title:(NSString *)title {
    WKFProductDetailControllerHelper *helper = [[WKFProductDetailControllerHelper alloc] initWithProductId:productId title:title];
    WKFProductDetailController *vc = [[WKFProductDetailController alloc] initWithHelper:helper];
    return vc;
}
@end
