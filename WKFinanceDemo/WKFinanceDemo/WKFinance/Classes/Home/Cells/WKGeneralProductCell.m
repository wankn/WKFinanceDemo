//
//  WKGeneralProductCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKGeneralProductCell.h"
#import "UIView+WKLayout.h"
#import "WKHomeTagsView.h"
#import "WKHomeProductProgress.h"

@interface WKGeneralProductCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;  /**< 标题 */
@property (weak, nonatomic) IBOutlet UILabel *profitLabel; /**< 收益率 */
@property (weak, nonatomic) IBOutlet UILabel *timeLimitLabel;  /**< 期限 */
@property (weak, nonatomic) IBOutlet UILabel *investBeginLabel;  /**< 起投 */
@property (weak, nonatomic) IBOutlet UILabel *investEndLabel;  /**< 剩余xxx */
@property (weak, nonatomic) IBOutlet UIButton *createButton;  /**< 立即投资 */
@property (weak, nonatomic) IBOutlet WKHomeTagsView *tagsView;
@property (weak, nonatomic) IBOutlet WKHomeProductProgress *progressView;


@property (nonatomic, strong) WKGeneralProductCellHelper *helper;
@end

@implementation WKGeneralProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self wk_addBottomSeparator];
    self.tagsView.backgroundColor = [UIColor clearColor];
    self.progressView.backgroundColor = [UIColor clearColor];
    self.createButton.layer.borderWidth = 1.0;
    self.createButton.layer.borderColor = [UIColor redColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureHelper:(WKGeneralProductCellHelper *)helper {
    self.helper = helper;
    self.titleLabel.text = self.helper.title;
    self.profitLabel.attributedText = self.helper.profitAttributedString;
    self.timeLimitLabel.attributedText = self.helper.timeLimitValue;
    self.investBeginLabel.text = self.helper.investBegin;
    self.investEndLabel.text = self.helper.surplusAmount;
    [self.tagsView configureTags:self.helper.tags];
    [self.progressView configureProgressValue:self.helper.investPercent];
}

@end
