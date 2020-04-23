//
//  JZBaseViewController.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZBaseViewController.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h> // 占位图框架
#import <KafkaRefresh/KafkaRefresh.h> // 上下拉刷新
#import "DGActivityIndicatorView.h" // Loading

@interface JZBaseViewController ()
<
DZNEmptyDataSetSource,
DZNEmptyDataSetDelegate
>

/** 刷新的scrollView */
@property (nonatomic,strong) UIScrollView *freshScrollview;
/** loadingIndicatorView */
@property (nonatomic,strong) DGActivityIndicatorView *loadingIndicatorView;

@end

@implementation JZBaseViewController

#pragma mark - =================== Life Cycle ===================

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupInit];
    
    [self _setupContentUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.isDisableScreenEdgeGesture) {
        // 不允许屏幕边缘手势返回
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES]; // 退下键盘
    if (self.isDisableScreenEdgeGesture) {
        //离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

#pragma mark - =================== Init Method ==================
- (void)_setupInit{
    self.view.backgroundColor = UIColor.whiteColor;
    _page = 1;
    _limit = 20;
    _reqStatue = None;
}

- (void)_setupContentUI {
    // i change it  wo ca 
}

#pragma mark - Base Setting
- (BOOL)isHidesBackButton {
    return NO;  // override this to change
}

- (BOOL)isDisableScreenEdgeGesture {
    return NO; // override this to change
}

- (NSString *)customBackTitle {
    return self.navigationItem.title;
}

// 请求完成
- (BOOL)isFinishLoading {
    if (self.reqStatue == ReqSuccess || self.reqStatue == ReqError) {
        return YES;
    }
    return NO;
}

// 还没请求完成
- (BOOL)isNotFinishLoading {
    return ![self isFinishLoading];
}

#pragma mark - EmptyData & Refresh 
// 设置占位信息
- (void)setEmptyDataWithScrollView:(UIScrollView *)scrollView {
    scrollView.emptyDataSetSource = self;
    scrollView.emptyDataSetDelegate = self;
}

// 设置上下拉刷新
- (void)setRefreshWithScrollView:(UIScrollView *)scrollview type:(RefreshType)type {
    self.freshScrollview = scrollview;
    if (type == HeaderOnly) {
        [self bindHeaderRefresh];
    }else if (type == FooterOnly) {
        [self bindFooterRefresh];
    }else {
        [self bindHeaderRefresh];
        [self bindFooterRefresh];
    }
}

- (void)bindHeaderRefresh {
    @weakify(self)
    [self.freshScrollview bindHeadRefreshHandler:^{
        @strongify(self)
        [self headerRefreshAction];
    } themeColor:Color_29CCCC refreshStyle:KafkaRefreshStyleReplicatorWoody];
}

- (void)bindFooterRefresh {
    @weakify(self)
    [self.freshScrollview bindFootRefreshHandler:^{
        @strongify(self)
        [self footerRefreshAction];
    } themeColor:Color_29CCCC refreshStyle:KafkaRefreshStyleReplicatorWoody];
}

- (void)headerRefreshAction {
    self.page = 1;
    [self loadRequest];
}

- (void)footerRefreshAction {
    self.page++;
    [self loadRequest];
}

#pragma mark - Loading

- (void)startLoading {
    self.loadingIndicatorView.hidden = NO;
    self.loadingIndicatorView.center = self.view.center;
    [self.view bringSubviewToFront:self.loadingIndicatorView];
    [self.loadingIndicatorView startAnimating];
}

- (void)stopLoading {
    self.loadingIndicatorView.hidden = YES;
    [self.loadingIndicatorView stopAnimating];
}

#pragma mark - Method
- (void)loadRequest {
    JZLog(@"base call loadRequest, this is for subVc imp");
}

/** 处理请求失败的error，在这里处理各种状态码对应的操作 */
- (void)handleRequestError:(NSError *)error refreshSuccessBlock:(nullable void(^)(void))block {
#warning to do
}

#pragma mark - ===================== Delegate ====================
#pragma mark  - DZNEmptyDataSetSource
//- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
//    if ([self isNotFinishLoading]) {
//        return nil;
//    }
//    NSString *text =  @"暂无数据";
//    NSDictionary *attributes = @{NSFontAttributeName: FONT_14,
//                                 NSForegroundColorAttributeName: UIColor.grayColor};
//    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    if ([self isNotFinishLoading]) { // 还没请求完成
        return nil;
    }
#warning to do
    // 这里更加请求成功或失败请求显示
    return [UIImage imageNamed:@"empty_icon"];
}

// 如果不实现此方法的话,无数据时下拉刷新不可用
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
}

#pragma mark - Lazy
- (DGActivityIndicatorView *)loadingIndicatorView {
    if (!_loadingIndicatorView) {
        DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallClipRotate tintColor:[UIColor whiteColor] size:30];
        [self.view addSubview:activityIndicatorView];
        activityIndicatorView.center = self.view.center;
        _loadingIndicatorView = activityIndicatorView;
    }
    return _loadingIndicatorView;
}

@end
