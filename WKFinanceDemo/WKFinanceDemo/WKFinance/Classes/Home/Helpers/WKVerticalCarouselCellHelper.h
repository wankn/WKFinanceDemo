//
//  WKVerticalCarouselCellHelper.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SBLib/SBLib.h>

@interface WKVerticalCarouselCellHelper : NSObject

@property (nonatomic, readonly) NSArray *titleList;

+ (WKVerticalCarouselCellHelper *)helperWithDataItemResult:(DataItemResult *)result;
@end
