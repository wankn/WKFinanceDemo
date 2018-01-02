//
//  WKModuleBasicController.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/12/21.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKModuleBasicController.h"
#import "Masonry.h"

#import "WKWebViewController+Factory.h"

@interface WKModuleBasicController ()

@end

@implementation WKModuleBasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self adjustInset];
    
    [self.view addSubview:self.mainCollectionView];
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self manualRefresh:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //通知界面即将显示
    [self routeViewWillAppear];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //通知界面已经显示
    [self routeViewDidAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //通知界面即将消失
    [self routeViewWillDisappear];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //通知界面已经消失
    [self routeViewDidDisappear];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.helper.sectionDataSourceList.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    if (self.helper.sectionDataSourceList.count > section) {
        id<WKModuleSectionDataSourceProtocol> sectionDataSource = self.helper.sectionDataSourceList[section];
        if ([sectionDataSource respondsToSelector:@selector(numberOfItems)]) {
            return [sectionDataSource numberOfItems];
        }
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.helper.sectionDataSourceList.count > indexPath.section) {
        id<WKModuleSectionDataSourceProtocol> sectionDataSource = self.helper.sectionDataSourceList[indexPath.section];
        
        if ([sectionDataSource respondsToSelector:@selector(cellClassNameAtIndexPath:)]) {
            
            NSString *cellName = [sectionDataSource cellClassNameAtIndexPath:indexPath];
            UICollectionViewCell<WKModuleCellProtocol> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellName forIndexPath:indexPath];
            
            //绑定代理
            if ([cell respondsToSelector:@selector(setDelegate:)]) {
                [cell setDelegate:self];
            }
            //绑定cell在主界面的位置
            if ([cell respondsToSelector:@selector(configureIndexPath:)]) {
                [cell configureIndexPath:indexPath];
            }
            
            if ([sectionDataSource respondsToSelector:@selector(cellHelperAtIndexPath:)]) {
                id<WKModuleCellHelperProtocol> cellHelper = [sectionDataSource cellHelperAtIndexPath:indexPath];
                //cell绑定cellHelper
                if ([cell respondsToSelector:@selector(configureCellHelper:)]) {
                    [cell configureCellHelper:cellHelper];
                }
            }
            return cell;
        }
    }
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = nil;
    if (self.helper.sectionDataSourceList.count > indexPath.section) {
        id<WKModuleSectionDataSourceProtocol> sectionDataSource = self.helper.sectionDataSourceList[indexPath.section];
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            if ([sectionDataSource respondsToSelector:@selector(viewForSectionHeaderAtIndexPath:collectionView:)]) {
                reusableView = [sectionDataSource viewForSectionHeaderAtIndexPath:indexPath collectionView:collectionView];
            }
        } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
            if ([sectionDataSource respondsToSelector:@selector(viewForSectionFooterAtIndexPath:collectionView:)]) {
                reusableView = [sectionDataSource viewForSectionFooterAtIndexPath:indexPath collectionView:collectionView];
            }
        }
        if (reusableView) {
            id<WKModuleReusableViewProtocol>idReusableView = (UICollectionReusableView<WKModuleReusableViewProtocol> *)reusableView;
            //绑定代理
            if ([idReusableView respondsToSelector:@selector(setDelegate:)]) {
                [idReusableView setDelegate:self];
            }
            //绑定位置
            if ([idReusableView respondsToSelector:@selector(configureIndexPath:)]) {
                [idReusableView configureIndexPath:indexPath];
            }
            //绑定helper
            if ([idReusableView respondsToSelector:@selector(configureHelper:)] && [sectionDataSource respondsToSelector:@selector(reusableViewHelperForSupplementaryElementOfKind:atIndexPath:)]) {
                id reusableViewHelper = [sectionDataSource reusableViewHelperForSupplementaryElementOfKind:kind atIndexPath:indexPath];
                [idReusableView configureHelper:reusableViewHelper];
            }
        }
    }
    //占位，因为layout需要每个sectionHeader都要有
    if ([kind isEqualToString:UICollectionElementKindSectionHeader] && !reusableView) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
    }
    return reusableView;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    //通知cell结束显示了
    if ([cell respondsToSelector:@selector(routeCellDidEndDisplaying)]) {
        [cell performSelector:@selector(routeCellDidEndDisplaying)];
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    //通知cell要显示了
    if ([cell respondsToSelector:@selector(routeCellWillDisplay)]) {
        [cell performSelector:@selector(routeCellWillDisplay)];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell<WKModuleCellProtocol> *cell = (UICollectionViewCell<WKModuleCellProtocol> *)[collectionView cellForItemAtIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(didSelect)]) {
        [cell performSelector:@selector(didSelect)];
    }
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
}

//- (BOOL)collectionView:(UICollectionView *)collectionView
//shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//- (void)collectionView:(UICollectionView *)colView
//didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
//    //设置(Nomal)正常状态下的颜色
//    [cell setBackgroundColor:[UIColor whiteColor]];
//}
//
//- (void)collectionView:(UICollectionView *)colView
//didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
//    //设置(Highlight)高亮下的颜色
//    [cell setBackgroundColor:RGB_HEX(0xD0D0D0)];
//    //[UIColor ef_homeHighlightBackColor]
//}

#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    
    if (self.helper.sectionDataSourceList.count > section) {
        id<WKModuleSectionDataSourceProtocol> sectionDataSource = self.helper.sectionDataSourceList[section];
        if ([sectionDataSource respondsToSelector:@selector(insetForSectionAtIndex:)]) {
            return [sectionDataSource insetForSectionAtIndex:section];
        }
    }
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.helper.sectionDataSourceList.count > indexPath.section) {
        id<WKModuleSectionDataSourceProtocol> sectionDataSource = self.helper.sectionDataSourceList[indexPath.section];
        if ([sectionDataSource respondsToSelector:@selector(sizeForItemAtIndexPath:)]) {
            return [sectionDataSource sizeForItemAtIndexPath:indexPath];
        }
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (self.helper.sectionDataSourceList.count > section) {
        id<WKModuleSectionDataSourceProtocol> sectionDataSource = self.helper.sectionDataSourceList[section];
        if ([sectionDataSource respondsToSelector:@selector(referenceSizeForHeaderInSection:)]) {
            return [sectionDataSource referenceSizeForHeaderInSection:section];
        }
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (self.helper.sectionDataSourceList.count > section) {
        id<WKModuleSectionDataSourceProtocol> sectionDataSource = self.helper.sectionDataSourceList[section];
        if ([sectionDataSource respondsToSelector:@selector(referenceSizeForFooterInSection:)]) {
            return [sectionDataSource referenceSizeForFooterInSection:section];
        }
    }
    return CGSizeZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (self.helper.sectionDataSourceList.count > section) {
        id<WKModuleSectionDataSourceProtocol> sectionDataSource = self.helper.sectionDataSourceList[section];
        if ([sectionDataSource respondsToSelector:@selector(minimumLineSpacingForSectionAtIndex:)]) {
            return [sectionDataSource minimumLineSpacingForSectionAtIndex:section];
        }
    }
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (self.helper.sectionDataSourceList.count > section) {
        id<WKModuleSectionDataSourceProtocol> sectionDataSource = self.helper.sectionDataSourceList[section];
        if ([sectionDataSource respondsToSelector:@selector(minimumInteritemSpacingForSectionAtIndex:)]) {
            return [sectionDataSource minimumInteritemSpacingForSectionAtIndex:section];
        }
    }
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if (@available(iOS 11.0, *)) {
        if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            view.layer.zPosition = 0;
        }
    }
}

#pragma mark - WKModuleControllerProtocol
/** 事件响应 */
- (void)switchToTargetControllerWithType:(NSInteger)type params:(NSDictionary *)params {
    
    WKWebViewController *vc = [WKWebViewController webViewControllerWithUrl:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - public methods
- (void)manualRefresh:(BOOL)manualRefresh {
    if (manualRefresh) {
        [self.mainCollectionView wk_beginRefresh];
    } else {
        [self.helper requestData];
    }
}

#pragma mark - private methods
/** 注册cell */
- (void)registerCells {
    
    //注册cell
    for (NSString *cellName in self.helper.cellNameSet) {
//        [self.mainCollectionView registerClass:NSClassFromString(cellName)
//                    forCellWithReuseIdentifier:cellName];
        [self.mainCollectionView registerNib:[UINib nibWithNibName:cellName bundle:nil]
                  forCellWithReuseIdentifier:cellName];
    }
    
    //注册header
    for (NSString *reusableViewName in self.helper.sectionHeaderNameSet) {
        [self.mainCollectionView registerClass:NSClassFromString(reusableViewName)
                    forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                           withReuseIdentifier:reusableViewName];
    }
    //注册footer
    for (NSString *reusableViewName in self.helper.sectionFooterNameSet) {
        [self.mainCollectionView registerClass:NSClassFromString(reusableViewName)
                    forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                           withReuseIdentifier:reusableViewName];
    }
    //容错cell
    [self.mainCollectionView registerClass:[UICollectionViewCell class]
                forCellWithReuseIdentifier:@"UICollectionViewCell"];
    //空白sectionHeader
    [self.mainCollectionView registerClass:[UICollectionReusableView class]
                forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                       withReuseIdentifier:@"UICollectionReusableView"];
}

/** 刷新列表 */
- (void)reloadCollectionView {
    
    [self.mainCollectionView reloadData];
}

- (void)adjustInset {
    if (@available(iOS 11.0, *)) {
        self.mainCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    CGFloat top = WKNavigationBarFullHeight;
    CGFloat bottom = 0;
    if (self.navigationController.viewControllers.count == 1) {
        bottom = WKTabbarFullHeight;
    } else {
        bottom = WKTabbarBottomSpace;
    }
    if ([self respondsToSelector:@selector(hideNavigationBar)]) {
        if ([self hideNavigationBar]) {
            //顶部导航栏隐藏了，就是0
            top = 0;
        }
    }
    self.mainCollectionView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    self.mainCollectionView.scrollIndicatorInsets = self.mainCollectionView.contentInset;
}

/** 通知视图即将显示 */
- (void)routeViewWillAppear {
    if (_mainCollectionView) {
        NSArray *cellList = [self.mainCollectionView visibleCells];
        for (UICollectionViewCell<WKModuleCellProtocol> *cell in cellList) {
            if ([cell respondsToSelector:@selector(routeControllerViewWillAppear)]) {
                [cell routeControllerViewWillAppear];
            }
        }
    }
}

/** 通知视图已经显示 */
- (void)routeViewDidAppear {
    if (_mainCollectionView) {
        NSArray *cellList = [self.mainCollectionView visibleCells];
        for (UICollectionViewCell<WKModuleCellProtocol> *cell in cellList) {
            if ([cell respondsToSelector:@selector(routeControllerViewDidAppear)]) {
                [cell routeControllerViewDidAppear];
            }
        }
    }
}

/** 通知视图即将消失 */
- (void)routeViewWillDisappear {
    if (_mainCollectionView) {
        NSArray *cellList = [self.mainCollectionView visibleCells];
        for (UICollectionViewCell<WKModuleCellProtocol> *cell in cellList) {
            if ([cell respondsToSelector:@selector(routeControllerViewWillDisappear)]) {
                [cell routeControllerViewWillDisappear];
            }
        }
    }
}

/** 通知视图已经消失 */
- (void)routeViewDidDisappear {
    if (_mainCollectionView) {
        NSArray *cellList = [self.mainCollectionView visibleCells];
        for (UICollectionViewCell<WKModuleCellProtocol> *cell in cellList) {
            if ([cell respondsToSelector:@selector(routeControllerViewDidDisappear)]) {
                [cell routeControllerViewDidDisappear];
            }
        }
    }
}

#pragma mark - getters
- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                 collectionViewLayout:layout];
        _mainCollectionView.dataSource = self;
        _mainCollectionView.delegate = self;
        _mainCollectionView.backgroundColor = self.view.backgroundColor;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        
        [_mainCollectionView wk_configureRefresh];
        [_mainCollectionView wk_configureLoadMore];
        [_mainCollectionView wk_setLoadMoreEnable:NO];//先开闭上提加载
        __weak typeof(self) weakSelf = self;
        _mainCollectionView.wk_beginRefreshCallBack = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.helper requestData];
            [strongSelf.mainCollectionView wk_endLoadMore];
        };
        _mainCollectionView.wk_beginLoadMoreCallBack = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.helper requestMoreData:NO];
            [strongSelf.mainCollectionView wk_endRefresh];
        };
        [self registerCells];
    }
    return _mainCollectionView;
}

- (WKModuleBasicControllerHelper *)helper {
    if (_helper) {
        return _helper;
    }
    if ([self respondsToSelector:@selector(createControllerHelper)]) {
        _helper = [self createControllerHelper];
        __weak typeof(self) weakSelf = self;
        _helper.reloadMainViewBlock = ^{
            [weakSelf reloadCollectionView];
        };
        return _helper;
    } else {
        return nil;
    }
}


@end
