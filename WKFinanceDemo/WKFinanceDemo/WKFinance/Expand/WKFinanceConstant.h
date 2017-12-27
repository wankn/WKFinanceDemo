//
//  WKFinanceConstant.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/21.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#ifndef WKFinanceConstant_h
#define WKFinanceConstant_h

/** 机型判断 */
//iPhoneX机型
#define WK_IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/** 色值 RGBA **/
#define RGB_A(r, g, b, a) [UIColor colorWithRed:(CGFloat)(r)/255.0f green:(CGFloat)(g)/255.0f blue:(CGFloat)(b)/255.0f alpha:(CGFloat)(a)]

/** 色值 RGB **/
#define RGB(r, g, b) RGB_A(r, g, b, 1)
#define RGB_HEX(__h__) RGB((__h__ >> 16) & 0xFF, (__h__ >> 8) & 0xFF, __h__ & 0xFF)

/** 屏幕尺寸 */
#define APP_UI_SCREEN_SIZE     ([UIScreen mainScreen].bounds.size)          //屏幕大小
#define APP_UI_SCREEN_FHEIGHT  ([UIScreen mainScreen].bounds.size.height)   //界面的高度
#define APP_UI_SCREEN_FWIDTH   ([UIScreen mainScreen].bounds.size.width)    //界面的宽度
#define WKNavigationBarFullHeight (WK_IS_IPHONE_X? 88.0f:64.0f) //顶部导航栏的高度
#define WKNavigationBarHeight 44.0f //顶部导航栏的高度
#define WKTabbarFullHeight (WK_IS_IPHONE_X? 83.0f:49.0f)  //底部tabbar的高度
#define WKStatusBarHeight  [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define WKTabbarBottomSpace (WK_IS_IPHONE_X? 34.0f:0.0f)  //IphoneX距离底部间距
#define WKLeftSpaceLandscape (WK_IS_IPHONE_X? 44.0f:0.0f)  //IphoneX横屏左边间距


#endif /* WKFinanceConstant_h */
