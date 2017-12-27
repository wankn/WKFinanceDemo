//
//  DataItemResult+WK.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "DataItemResult+WK.h"

@implementation DataItemResult (WK)

- (void)wk_bulidResultWithArray:(NSArray *)array {
    for (id value in array) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            DataItemDetail *detail = [DataItemDetail detailFromDictionary:value];
            [self addItem:detail];
        }
    }
}

- (void)wk_bulidResultWithArray:(NSArray *)array maxCount:(NSInteger)maxCount {
    
    for (int i = 0; i < MIN(array.count, maxCount); i ++) {
        id obj = array[i];
        if ([obj isKindOfClass:[NSDictionary class]]) {
            DataItemDetail *detail = [DataItemDetail detailFromDictionary:obj];
            [self addItem:detail];
        }
    }
}

@end
