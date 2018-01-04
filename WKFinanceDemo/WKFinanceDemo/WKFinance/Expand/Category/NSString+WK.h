//
//  NSString+WK.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (WK)

/** 去除最后一位0，例：5.90 变成 5.9 */
- (NSString *)wk_rejectLastZero;

/** 以万字结尾 */
- (NSString *)ef_suffixWanFormatString;

- (CGSize)wk_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
