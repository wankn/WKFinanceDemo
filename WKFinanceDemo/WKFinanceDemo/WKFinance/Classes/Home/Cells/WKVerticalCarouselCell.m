//
//  WKVerticalCarouselCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKVerticalCarouselCell.h"
#import "SDCycleScrollView.h"

@interface WKVerticalCarouselCell()
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;

@end

@implementation WKVerticalCarouselCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark -
- (void)configureHelper:(WKVerticalCarouselCellHelper *)helper {
    [self setupCycleScrollView];
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
