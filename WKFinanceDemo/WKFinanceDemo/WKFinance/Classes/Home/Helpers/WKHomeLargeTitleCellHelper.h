//
//  WKHomeLargeTitleCellHelper.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKHomeLargeTitleCellHelper.h"

@interface WKHomeLargeTitleCellHelper : NSObject

@property (nonatomic, readonly) NSString *largeTitle;
@property (nonatomic, readonly) NSString *subTitle;

+ (WKHomeLargeTitleCellHelper *)helperWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
