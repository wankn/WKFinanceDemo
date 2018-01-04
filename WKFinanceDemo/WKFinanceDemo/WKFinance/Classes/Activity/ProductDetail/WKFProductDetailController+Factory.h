//
//  WKFProductDetailController+Factory.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "WKFProductDetailController.h"

@interface WKFProductDetailController (Factory)
+ (WKFProductDetailController *)productDetailControllerWithProductId:(NSString *)productId
                                                               title:(NSString *)title;
@end
