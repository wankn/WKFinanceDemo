//
//  WKWebViewInteractionCenter.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/5.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WKWebViewConstant.h"

@interface WKWebViewInteractionCenter : NSObject

@property (nonatomic, assign) UIViewController<WKWebViewControllerPortocol> *controller;

@end
