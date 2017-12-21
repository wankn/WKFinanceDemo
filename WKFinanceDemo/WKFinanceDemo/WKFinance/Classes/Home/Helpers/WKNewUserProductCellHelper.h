//
//  WKNewUserProductCellHelper.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SBLib/SBLib.h>


@interface WKNewUserProductCellHelper : NSObject

@property (nonatomic, readonly) NSString *profit; /**< <#note#> */
@property (nonatomic, readonly) NSString *investBegin;  /**< <#note#> */
@property (nonatomic, readonly) NSString *descriptionText;  /**< <#note#> */
@property (nonatomic, readonly) NSString *timeLimitValue;  /**< <#note#> */

+ (WKNewUserProductCellHelper *)helperWithDataItemDetail:(DataItemDetail *)detail;

@end
