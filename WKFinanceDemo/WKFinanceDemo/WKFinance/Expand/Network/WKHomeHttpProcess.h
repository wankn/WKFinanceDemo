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

+ (WKHomeHttpLoader *)requestHomeDataWithDelegate:(id<SBHttpDataLoaderDelegate>)delegate;

@end
