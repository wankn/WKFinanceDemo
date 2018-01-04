//
//  WKModuleNewUserProductCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/22.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleNewUserProductCell.h"
#import "WKModuleBasicProtocol.h"
#import "WKNewUserProductCellHelper.h"

@interface WKModuleNewUserProductCell()
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *indexDesLabel;
@property (weak, nonatomic) IBOutlet UILabel *minBuyAmoutLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;

@property (nonatomic, strong) WKNewUserProductCellHelper *helper;
@end

@implementation WKModuleNewUserProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}

#pragma mark - WKModuleCellProtocol
/** 绑定cellHelper */
- (void)configureCellHelper:(id)cellHelper {
    self.helper = cellHelper;
    self.indexLabel.text = self.helper.profit;
    self.minBuyAmoutLabel.text = self.helper.investBegin;
    self.timeLabel.text = self.helper.timeLimitValue;
}

- (void)didSelect {
    if (self.delegate && [self.delegate respondsToSelector:@selector(switchToTargetControllerWithType:params:)]) {
        [self.delegate switchToTargetControllerWithType:WKModuleTypeNewUserProduct params:self.helper.linkParams];
    }
}

@end
