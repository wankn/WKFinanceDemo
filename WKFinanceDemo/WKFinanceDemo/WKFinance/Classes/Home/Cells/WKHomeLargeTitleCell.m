//
//  WKHomeLargeTitleCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/20.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeLargeTitleCell.h"
#import "UIView+WKLayout.h"

@interface WKHomeLargeTitleCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

@implementation WKHomeLargeTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self wk_addSpaceBottomSeparator];
}

- (void)configureHelper:(WKHomeLargeTitleCellHelper *)helper {
    self.titleLabel.text = helper.largeTitle;
    self.subTitleLabel.text = helper.subTitle;
}

@end
