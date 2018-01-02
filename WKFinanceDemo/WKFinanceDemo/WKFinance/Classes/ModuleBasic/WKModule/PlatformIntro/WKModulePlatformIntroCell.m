//
//  WKModulePlatformIntroCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModulePlatformIntroCell.h"

@interface WKModulePlatformIntroCell()
@property (weak, nonatomic) IBOutlet UIImageView *leftImgView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImgView;
@property (weak, nonatomic) IBOutlet UILabel *leftTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftSubTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightSubTitleLabel;
@end


@implementation WKModulePlatformIntroCell

- (void)awakeFromNib {
    [super awakeFromNib];
     self.backgroundColor = [UIColor whiteColor];
    self.leftTitleLabel.adjustsFontSizeToFitWidth = YES;
    self.leftSubTitleLabel.adjustsFontSizeToFitWidth = YES;
    self.rightTitleLabel.adjustsFontSizeToFitWidth = YES;
    self.rightSubTitleLabel.adjustsFontSizeToFitWidth = YES;
}

#pragma mark - WKModuleCellProtocol
/** 绑定cellHelper */
- (void)configureCellHelper:(id)cellHelper {
    
}

- (void)didSelect {
    if (self.delegate && [self.delegate respondsToSelector:@selector(switchToTargetControllerWithType:params:)]) {
        [self.delegate switchToTargetControllerWithType:WKModuleTypePlatformIntro params:nil];
    }
}

@end
