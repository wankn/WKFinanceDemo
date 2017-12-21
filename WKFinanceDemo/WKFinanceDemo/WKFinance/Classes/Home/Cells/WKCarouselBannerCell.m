//
//  WKCarouselBannerCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKCarouselBannerCell.h"
#import "SDCycleScrollView.h"

@interface WKCarouselBannerCell()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;
@property (strong, nonatomic) WKCarouselBannerCellHelper *helper;
@end

@implementation WKCarouselBannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
}


#pragma mark - public methods
- (void)configureHelper:(WKCarouselBannerCellHelper *)helper {
    [self setupCycleScrollView];
    self.cycleScrollView.imageURLStringsGroup = helper.imagesUrlList;
}

#pragma mark -
- (void)setupCycleScrollView {
    self.cycleScrollView.delegate = self;
    self.cycleScrollView.backgroundColor = [UIColor clearColor];
}

@end
