//
//  WKTabBarController.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/27.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKTabBarController.h"
#import "UIColor+WK.h"

@interface WKTabBarController ()

@end

@implementation WKTabBarController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITabBarItem *item0 = self.tabBar.items.count>0?[self.tabBar.items objectAtIndex:0]:nil;
    UITabBarItem *item1 = self.tabBar.items.count>1?[self.tabBar.items objectAtIndex:1]:nil;
    UITabBarItem *item2 = self.tabBar.items.count>2?[self.tabBar.items objectAtIndex:2]:nil;
    UITabBarItem *item3 = self.tabBar.items.count>3?[self.tabBar.items objectAtIndex:3]:nil;
    item0.selectedImage = [[UIImage imageNamed:@"wk_tab_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.image = [[UIImage imageNamed:@"wk_tab_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.selectedImage = [[UIImage imageNamed:@"wk_tab_finance_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"wk_tab_finance"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"wk_tab_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"wk_tab_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [[UIImage imageNamed:@"wk_tab_more_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"wk_tab_more"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBar.tintColor = [UIColor wk_defaultRedColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
