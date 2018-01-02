//
//  WKBasicController.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKBasicController.h"
#import "WKFinanceConstant.h"
#import "WKBasicController+WKF.h"
#import "UIColor+WK.h"


@interface WKBasicController ()
@property (nonatomic, strong) WKFNavigationBar *navigationBar;
@end

@implementation WKBasicController

- (instancetype)init {
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor wk_bgColor];
    [self setNavigationBar];
    self.navigationController.navigationBar.hidden = YES;
    [self wr_setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self wkhide_viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self wkhide_viewWillDisappear:animated];
}

#pragma mark - private methods
- (void)setNavigationBar {
    [self.view addSubview:self.navigationBar];
    if (self.navigationController.childViewControllers.count != 1) {
        [self.navigationBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"wk_navigation_back"]];
    }
}

- (WKFNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [WKFNavigationBar CustomNavigationBar];
    }
    return _navigationBar;
}

@end
