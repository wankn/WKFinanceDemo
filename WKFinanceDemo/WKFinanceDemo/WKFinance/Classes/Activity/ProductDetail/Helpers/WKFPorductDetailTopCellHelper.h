//
//  WKFPorductDetailTopCellHelper.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SBLib/SBLib.h>

@interface WKFPorductDetailTopCellHelper : NSObject

@property (nonatomic, readonly) NSAttributedString *yieldText; /**< 收益率 */
@property (nonatomic, readonly) NSString *yieldDesText;
@property (nonatomic, readonly) NSArray *tags; /**< 标签数组 */

@property (nonatomic, readonly) NSAttributedString *plstimeLimitValue; /**< 投资期限 */
@property (nonatomic, readonly) NSString *plstimeLimitValueDes;
@property (nonatomic, readonly) NSAttributedString *surplusAmount; /**< 剩余金额 */
@property (nonatomic, readonly) NSString *surplusAmountDes;
@property (nonatomic, readonly) NSAttributedString *productsScale; /**< 项目总额 */
@property (nonatomic, readonly) NSString *productsScaleDes;

- (void)configureDetail:(DataItemDetail *)detail;

@end
