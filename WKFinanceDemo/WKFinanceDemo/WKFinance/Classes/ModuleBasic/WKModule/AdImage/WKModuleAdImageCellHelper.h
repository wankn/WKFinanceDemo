//
//  WKModuleAdImageCellHelper.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKModuleBasicProtocol.h"

@interface WKModuleAdImageCellHelper : NSObject<WKModuleCellHelperProtocol>

@property (nonatomic, readonly) NSString *adImageUrl;
@property (nonatomic, readonly) NSString *nativeImageName;


@end
