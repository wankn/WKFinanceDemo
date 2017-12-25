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

@interface WKModuleProductCell()
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yieldLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingInvestmentLabel;
@property (weak, nonatomic) IBOutlet WKHomeTagsView *tagsView;

@end


@implementation WKModuleProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     self.backgroundColor = [UIColor whiteColor];
}

#pragma mark - WKModuleCellProtocol
/** 绑定cellHelper */
- (void)configureCellHelper:(id)cellHelper {
    WKModuleProductCellHelper *helper = cellHelper;
    self.productNameLabel.text = helper.title;
    self.yieldLabel.attributedText = helper.profitAttributedString;
    self.timeLabel.attributedText = helper.timeLimitValue;
    self.remainingInvestmentLabel.attributedText = helper.surplusAmount;
}

@end