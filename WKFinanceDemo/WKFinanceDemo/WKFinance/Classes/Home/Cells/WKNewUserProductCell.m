//
//  WKNewUserProductCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKNewUserProductCell.h"

@interface WKNewUserProductCell()
@property (weak, nonatomic) IBOutlet UILabel *profitLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *investBeginLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLimitLabel;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

@property (nonatomic, strong) WKNewUserProductCellHelper *helper;
@end

@implementation WKNewUserProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.createButton.layer.cornerRadius = 15;
    self.createButton.layer.borderWidth = 1.0;
    self.createButton.layer.borderColor = [UIColor redColor].CGColor;
    self.createButton.layer.masksToBounds = YES;
}

- (void)configureHelper:(WKNewUserProductCellHelper *)helepr {
    self.helper = helepr;
    self.profitLabel.text = self.helper.profit;
    self.descriptionLabel.text = self.helper.descriptionText;
    self.investBeginLabel.text = self.helper.investBegin;
    self.timeLimitLabel.text = self.helper.timeLimitValue;
}



@end
