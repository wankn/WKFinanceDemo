//
//  WKHomeLargeTitleCellHelper.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeLargeTitleCellHelper.h"

@interface WKHomeLargeTitleCellHelper()
@property (nonatomic, copy) NSString *largeTitle;
@property (nonatomic, copy) NSString *subTitle;
@end


@implementation WKHomeLargeTitleCellHelper

+ (WKHomeLargeTitleCellHelper *)helperWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    return [[self alloc] initWithTitle:title subTitle:subTitle];
}

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    if (self = [super init]) {
        self.largeTitle = title;
        self.subTitle = subTitle;
    }
    return self;
}

@end
