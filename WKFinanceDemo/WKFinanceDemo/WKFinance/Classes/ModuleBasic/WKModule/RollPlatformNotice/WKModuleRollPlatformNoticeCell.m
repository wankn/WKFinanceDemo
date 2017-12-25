//
//  WKModuleRollPlatformNoticeCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleRollPlatformNoticeCell.h"
#import "SDCycleScrollView.h"
#import "WKModuleBasicProtocol.h"
#import "WKModuleRollPlatformNoticeCellHelper.h"
#import "UIView+WKLayout.h"

@interface WKModuleRollPlatformNoticeCell()<WKModuleCellProtocol>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;
@end

@implementation WKModuleRollPlatformNoticeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     self.backgroundColor = [UIColor whiteColor];
    [self wk_addBottomSeparator];
}

#pragma mark - WKModuleCellProtocol
/** 绑定cellHelper */
- (void)configureCellHelper:(id)cellHelper {
    [self setupCycleScrollView];
    WKModuleRollPlatformNoticeCellHelper *helper = cellHelper;
    self.cycleScrollView.titlesGroup = helper.titleList;
}

- (void)setupCycleScrollView {
    
    self.cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.cycleScrollView.onlyDisplayText = YES;
    self.cycleScrollView.titleLabelBackgroundColor = [UIColor clearColor];
    self.cycleScrollView.titleLabelTextColor = [UIColor blackColor];
    [self.cycleScrollView disableScrollGesture];
}

@end
