//
//  WKHomeController.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKHomeController.h"
#import "WKHomeControllerHelper.h"

@interface WKHomeController ()

@end

@implementation WKHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - WKModuleControllerProtocol
- (id)createControllerHelper {
    WKHomeControllerHelper *helper = [[WKHomeControllerHelper alloc] init];
    __weak typeof(self) weakSelf = self;
    helper.requestFinishBlock = ^(BOOL hasError, NSString *message) {
        [weakSelf.mainCollectionView wk_endRefresh];
        [weakSelf.mainCollectionView reloadData];
    };
    return helper;
}





//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor wk_bgColor];
//    [self.view addSubview:self.tableView];
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//    [self.helper requestHomeData];
//    self.navigationController.navigationBarHidden = YES;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.helper.cellHelperList.count;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (self.helper.cellHelperList.count > 0) {
//        return [self.helper.cellHelperList[section] count];
//    }
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    if (self.helper.cellHelperList.count > indexPath.section) {
//        NSArray *arr = self.helper.cellHelperList[indexPath.section];
//        if (arr.count > indexPath.row) {
//            id cellHelper = arr[indexPath.row];
//
//            if ([cellHelper isKindOfClass:NSClassFromString(@"WKCarouselBannerCellHelper")]) {
//                WKCarouselBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKCarouselBannerCell" forIndexPath:indexPath];
//                if (arr.count > indexPath.row) {
//                    [cell configureHelper:arr[indexPath.row]];
//                }
//                return cell;
//            } else if ([cellHelper isKindOfClass:NSClassFromString(@"WKVerticalCarouselCellHelper")]) {
//                WKVerticalCarouselCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKVerticalCarouselCell" forIndexPath:indexPath];
//                if (arr.count > indexPath.row) {
//                    [cell configureHelper:arr[indexPath.row]];
//                }
//                return cell;
//            } else if ([cellHelper isKindOfClass:NSClassFromString(@"WKHomeSafeCellHelper")]) {
//                WKHomeSafeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKHomeSafeCell" forIndexPath:indexPath];
//                return cell;
//            } else if ([cellHelper isKindOfClass:NSClassFromString(@"WKHomeLargeTitleCellHelper")]) {
//                WKHomeLargeTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKHomeLargeTitleCell" forIndexPath:indexPath];
//                if (arr.count > indexPath.row) {
//                    [cell configureHelper:arr[indexPath.row]];
//                }
//                return cell;
//            } else if ([cellHelper isKindOfClass:NSClassFromString(@"WKNewUserProductCellHelper")]) {
//                WKNewUserProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKNewUserProductCell" forIndexPath:indexPath];
//                if (arr.count > indexPath.row) {
//                    [cell configureHelper:arr[indexPath.row]];
//                }
//                return cell;
//            } else if ([cellHelper isKindOfClass:NSClassFromString(@"WKGeneralProductCellHelper")]) {
//                WKGeneralProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKGeneralProductCell" forIndexPath:indexPath];
//                if (arr.count > indexPath.row) {
//                    [cell configureHelper:arr[indexPath.row]];
//                }
//                return cell;
//            }
//        }
//    }
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];;
//    return cell;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return [[UIView alloc] init];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        return 0;
//    }
//    return 15;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}
//
//#pragma mark - private methods
//- (void)registerCell {
//    NSArray *arr = @[@"WKCarouselBannerCell",
//                     @"WKVerticalCarouselCell",
//                     @"WKHomeSafeCell",
//                     @"WKNewUserProductCell",
//                     @"WKGeneralProductCell",
//                     @"UITableViewCell",
//                     @"WKHomeLargeTitleCell"];
//    for (NSString *cellName in arr) {
//        [self.tableView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];
//    }
//}
//
//#pragma mark - getters
//- (UITableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        _tableView.backgroundColor = [UIColor clearColor];
//        _tableView.estimatedRowHeight = 44;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
////        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        [self registerCell];
//    }
//    return _tableView;
//}
//
//- (WKHomeControllerHelper *)helper {
//    if (!_helper) {
//        _helper = [[WKHomeControllerHelper alloc] init];
//        __weak typeof(self) weakSelf = self;
//        _helper.requestHomeDataFinishBlock = ^(BOOL success, NSString *message) {
//            [weakSelf.tableView reloadData];
//        };
//    }
//    return _helper;
//}

@end
