//
//  WKCarouselBannerCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKCarouselBannerCell.h"
#import "WKCarouselBannerCellHelper.h"
#import "WKModuleBasicProtocol.h"
#import "SDCycleScrollView.h"

@interface WKCarouselBannerCell()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;
@property (strong, nonatomic) WKCarouselBannerCellHelper *helper;
@end

@implementation WKCarouselBannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     self.backgroundColor = [UIColor whiteColor];
}

#pragma mark - SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
}

#pragma mark - WKModuleCellProtocol
/** 绑定cellHelper */
- (void)configureCellHelper:(id)cellHelper {
    [self setupCycleScrollView];
    self.helper = cellHelper;
    self.cycleScrollView.imageURLStringsGroup = self.helper.imagesUrlList;
}

- (void)didSelect {
    if (self.delegate && [self.delegate respondsToSelector:@selector(switchToTargetControllerWithType:params:)]) {
        [self.delegate switchToTargetControllerWithType:WKModuleTypeBanner params:nil];
    }
}

- (void)routeControllerViewDidAppear {
    self.cycleScrollView.autoScroll = YES;
}

- (void)routeControllerViewWillDisappear {
    self.cycleScrollView.autoScroll = NO;
}

- (void)routeCellWillDisplay {
    self.cycleScrollView.autoScroll = YES;
}

- (void)routeCellDidEndDisplaying {
    self.cycleScrollView.autoScroll = NO;
}

#pragma mark - private methods
- (void)setupCycleScrollView {
    self.cycleScrollView.delegate = self;
    self.cycleScrollView.backgroundColor = [UIColor clearColor];
}

@end
