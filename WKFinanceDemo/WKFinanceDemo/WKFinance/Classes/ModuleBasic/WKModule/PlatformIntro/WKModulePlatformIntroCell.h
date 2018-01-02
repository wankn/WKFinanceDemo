//
//  WKModulePlatformIntroCell.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKModuleBasicProtocol.h"

@interface WKModulePlatformIntroCell : UICollectionViewCell<WKModuleCellProtocol>
/** 代理 */
@property (nonatomic, weak) id<WKModuleControllerProtocol> delegate;
@end
