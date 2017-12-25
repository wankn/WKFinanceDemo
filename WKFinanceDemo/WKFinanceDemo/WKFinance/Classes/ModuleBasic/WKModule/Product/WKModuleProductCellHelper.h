//
//  WKModuleProductCellHelper.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SBLib/DataItemDetail.h>
#import "WKModuleBasicProtocol.h"

@interface WKModuleProductCellHelper : NSObject<WKModuleCellHelperProtocol>

@property (nonatomic, readonly) NSString *title;  /**< 标题 */
@property (nonatomic, readonly) NSAttributedString *profitAttributedString; /**< 收益率属性字符串 */
@property (nonatomic, readonly) NSAttributedString *timeLimitValue; /**< 期限 */
@property (nonatomic, readonly) NSString *investBegin;  /**< 起投 */
@property (nonatomic, readonly) NSAttributedString *surplusAmount;  /**< 剩余 */
@property (nonatomic, readonly) NSArray *tags;  /**< 标签数组 */
@property (nonatomic, readonly) NSString *investPercent; /**< 已售百分比 */

@end
