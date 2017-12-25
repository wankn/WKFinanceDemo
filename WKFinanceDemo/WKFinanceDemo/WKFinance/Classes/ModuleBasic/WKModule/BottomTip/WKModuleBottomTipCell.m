//
//  WKModuleBottomTipCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleBottomTipCell.h"
#import "WKModuleBottomTipCellHelper.h"

@interface WKModuleBottomTipCell()<WKModuleCellProtocol>
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UIView *leftDot;
@property (weak, nonatomic) IBOutlet UIView *rightDot;

@end

@implementation WKModuleBottomTipCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.leftDot.layer.cornerRadius = 2.5f;
    self.rightDot.layer.cornerRadius = 2.5f;
    self.tipLabel.adjustsFontSizeToFitWidth = YES;
}

#pragma mark - WKModuleCellProtocol
/** 绑定cellHelper */
- (void)configureCellHelper:(id)cellHelper {
    WKModuleBottomTipCellHelper *helper = cellHelper;
    self.tipLabel.text = helper.tipString;
}


@end
