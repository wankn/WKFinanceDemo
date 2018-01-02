//
//  WKModuleAdImageCell.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/25.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleAdImageCell.h"
#import "WKModuleAdImageCellHelper.h"
#import <UIImageView+WebCache.h>

@interface WKModuleAdImageCell()<WKModuleCellProtocol>
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@end

@implementation WKModuleAdImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}


#pragma mark - WKModuleCellProtocol
/** 绑定cellHelper */
- (void)configureCellHelper:(id)cellHelper {
    
    WKModuleAdImageCellHelper *helper = cellHelper;
    if (helper.nativeImageName.length > 0) {
        self.adImageView.image = [UIImage imageNamed:helper.nativeImageName];
    } else {
        [self.adImageView sd_setImageWithURL:[NSURL URLWithString:helper.adImageUrl]];
    }
}

- (void)didSelect {
    if (self.delegate && [self.delegate respondsToSelector:@selector(switchToTargetControllerWithType:params:)]) {
        [self.delegate switchToTargetControllerWithType:WKModuleTypeNewAd params:nil];
    }
}


@end
