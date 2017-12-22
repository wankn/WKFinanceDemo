//
//  WKFinanceConstant.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/21.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#ifndef WKFinanceConstant_h
#define WKFinanceConstant_h

/** 色值 RGBA **/
#define RGB_A(r, g, b, a) [UIColor colorWithRed:(CGFloat)(r)/255.0f green:(CGFloat)(g)/255.0f blue:(CGFloat)(b)/255.0f alpha:(CGFloat)(a)]

/** 色值 RGB **/
#define RGB(r, g, b) RGB_A(r, g, b, 1)
#define RGB_HEX(__h__) RGB((__h__ >> 16) & 0xFF, (__h__ >> 8) & 0xFF, __h__ & 0xFF)

#define APP_UI_SCREEN_SIZE     ([UIScreen mainScreen].bounds.size)          //屏幕大小
#define APP_UI_SCREEN_FHEIGHT  ([UIScreen mainScreen].bounds.size.height)   //界面的高度
#define APP_UI_SCREEN_FWIDTH   ([UIScreen mainScreen].bounds.size.width)    //界面的宽度


#endif /* WKFinanceConstant_h */
