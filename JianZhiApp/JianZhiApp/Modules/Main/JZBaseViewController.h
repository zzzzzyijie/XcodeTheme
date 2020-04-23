//
//  JZBaseViewController.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger,RequestState) { // 当前的请求状态
    None = 1 << 0, // 初始状态
    ReqLoading = 1 << 1, // 正在请求
    ReqSuccess = 1 << 2, // 请求成功
    ReqError = 1 << 3 // 请求错误
};

typedef NS_ENUM(NSInteger,RefreshType) { // 刷新的设置
    HeaderOnly, // 只设置头部刷新
    FooterOnly, // 只设置底部刷新
    Both        // 两个都设置
};

@interface JZBaseViewController : UIViewController

#pragma mark - Base Setting
/** 请求状态 */
@property (nonatomic,assign) RequestState reqStatue;
/** page 默认=1 (分页时用 */
@property (nonatomic,assign) NSInteger page;
/** limit 默认=20 (分页时用 */
@property (nonatomic,assign) NSInteger limit;
/** isDisableScreenEdgeGesture 标记是否禁用左滑返回 默认NO */
- (BOOL)isDisableScreenEdgeGesture;
/** 是否隐藏 BackButton (默认NO */
- (BOOL)isHidesBackButton;
/** 下一个页面的back title */
- (NSString *)customBackTitle;

#pragma mark - EmptyData & Refresh
// 设置占位信息
- (void)setEmptyDataWithScrollView:(UIScrollView *)scrollView;
// 设置上下拉刷新
- (void)setRefreshWithScrollView:(UIScrollView *)scrollview type:(RefreshType)type;
- (void)headerRefreshAction;
- (void)footerRefreshAction;

#pragma mark - Loading
- (void)startLoading;
- (void)stopLoading;

#pragma mark - Method
/** controller里的请求 (暴露，用户让其刷新，重新请求的操作 */
- (void)loadRequest;

/** 处理请求失败的error，在这里处理各种状态码对应的操作 */
- (void)handleRequestError:(NSError *)error refreshSuccessBlock:(nullable void(^)(void))block;



@end

NS_ASSUME_NONNULL_END
