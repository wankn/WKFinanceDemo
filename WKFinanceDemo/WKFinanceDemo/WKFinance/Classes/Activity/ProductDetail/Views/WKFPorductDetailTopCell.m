//
//  WKFPorductDetailTopCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2018/1/3.
//  Copyright © 2018年 wangkun. All rights reserved.
//

#import "WKFPorductDetailTopCell.h"
#import "WKHomeTagsView.h"

@interface WKFPorductDetailTopCell()
@property (weak, nonatomic) IBOutlet UILabel *yieldLabel;
@property (weak, nonatomic) IBOutlet UILabel *yieldDesLabel;
@property (weak, nonatomic) IBOutlet WKHomeTagsView *productTagsView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeSubLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingInvestmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingInvestmentSubLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalInvestmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalInvestmentSubLabel;

@property (nonatomic, strong) WKFPorductDetailTopCellHelper *helper;
@end


@implementation WKFPorductDetailTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)configureHelper:(WKFPorductDetailTopCellHelper *)heleper {
    self.helper = heleper;
    self.yieldLabel.attributedText = self.helper.yieldText;
    self.yieldDesLabel.text = self.helper.yieldDesText;
    [self.productTagsView configureTags:self.helper.tags];
    self.timeLabel.attributedText = self.helper.plstimeLimitValue;
    self.timeSubLabel.text = self.helper.plstimeLimitValueDes;
    self.remainingInvestmentLabel.attributedText = self.helper.surplusAmount;
    self.remainingInvestmentSubLabel.text = self.helper.surplusAmountDes;
    self.totalInvestmentLabel.attributedText = self.helper.productsScale;
    self.totalInvestmentSubLabel.text = self.helper.productsScaleDes;
}

@end
