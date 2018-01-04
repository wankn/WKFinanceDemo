//
//  WKModuleProductCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleProductCell.h"
#import "WKHomeTagsView.h"
#import "WKModuleProductCellHelper.h"
#import "WKProductPrograss.h"

@interface WKModuleProductCell()
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;//标的名
@property (weak, nonatomic) IBOutlet UILabel *yieldLabel;//收益率
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;//投资期限
@property (weak, nonatomic) IBOutlet UILabel *remainingInvestmentLabel;//剩余投资
@property (weak, nonatomic) IBOutlet UILabel *yieldDesLabel;//收益率描述
@property (weak, nonatomic) IBOutlet WKHomeTagsView *tagsView;
@property (weak, nonatomic) IBOutlet WKProductPrograss *progress;
@property (weak, nonatomic) IBOutlet UIImageView *selloutImageView;

@property (nonatomic, strong) WKModuleProductCellHelper *helper;
@end

@implementation WKModuleProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.yieldLabel.adjustsFontSizeToFitWidth = YES;
    self.timeLabel.adjustsFontSizeToFitWidth = YES;
    self.remainingInvestmentLabel.adjustsFontSizeToFitWidth = YES;
    self.yieldDesLabel.adjustsFontSizeToFitWidth = YES;
    self.backgroundColor = [UIColor whiteColor];
    [self.progress configureForeRadius:25 foreLineWidth:4];
    self.selloutImageView.hidden = YES;
}

#pragma mark - WKModuleCellProtocol
/** 绑定cellHelper */
- (void)configureCellHelper:(id)cellHelper {
    self.helper = cellHelper;
    self.productNameLabel.text = self.helper.title;
    self.yieldLabel.attributedText = self.helper.profitAttributedString;
    self.timeLabel.attributedText = self.helper.timeLimitValue;
    self.remainingInvestmentLabel.attributedText = self.helper.surplusAmount;
    if (self.helper.investPercent.floatValue < 1.0) {
        [self.progress updateProgressValue:self.helper.investPercent.floatValue animate:YES];
        self.selloutImageView.hidden = YES;
    } else {
        [self.progress updateProgressValue:0 animate:NO];
        self.selloutImageView.hidden = NO;
    }
    [self.tagsView configureTags:self.helper.tags];
}

- (void)didSelect {
    if (self.delegate && [self.delegate respondsToSelector:@selector(switchToTargetControllerWithType:params:)]) {
        [self.delegate switchToTargetControllerWithType:WKModuleTypeProduct params:self.helper.linkParams];
    }
}

@end
