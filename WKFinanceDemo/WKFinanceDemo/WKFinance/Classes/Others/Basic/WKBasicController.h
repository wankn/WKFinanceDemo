//
//  WKBasicController.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol WKBasicControllerProtocol<NSObject>
@optional
/** 导航栏是否隐藏 */
- (BOOL)hideNavigationBar;
@end



@interface WKBasicController : UIViewController<WKBasicControllerProtocol>

@end
