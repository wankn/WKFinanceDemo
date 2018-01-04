//
//  NSString+WK.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "NSString+WK.h"

@implementation NSString (WK)
/** 去除最后一位0，例：5.90 变成 5.9 */
- (NSString *)wk_rejectLastZero {
    
    if ([self rangeOfString:@"."].location == NSNotFound) {
        return self;
    }
    if ([self hasSuffix:@"."]) {
        return [self substringToIndex:self.length-1];
    }
    if ([self hasSuffix:@"0"]) {
        return [[self substringToIndex:self.length-1] wk_rejectLastZero];
    }
    return self;
}

- (NSString *)ef_suffixWanFormatString {
    NSString *tmp = [NSString stringWithFormat:@"%.2f",self.doubleValue];
    if ([tmp hasSuffix:@"0000.00"]) {
        NSString *string = [tmp substringToIndex:tmp.length - 7];
        return [NSString stringWithFormat:@"%@万",string];
    }
    return tmp;
}

static inline CGSize wk_ajustedSize(CGSize originalSize) {
    CGSize ajustedSize = originalSize;
    ajustedSize.width = ceilf(originalSize.width);
    ajustedSize.height = ceilf(originalSize.height);
    return ajustedSize;
}

- (CGSize)wk_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    return wk_ajustedSize([self boundingRectWithSize:size
                                        options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil].size);
}


@end
