//
//  JZNavigationController.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZNavigationController.h"
// Controller
#import "JZBaseViewController.h"

@interface JZNavigationController ()
<
UIGestureRecognizerDelegate,
UINavigationControllerDelegate
>

@end


@implementation JZNavigationController

#pragma mark - =================== Life Cycle ===================
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupInit];
}

#pragma mark - =========================== Inial Method ====================================
- (void)_setupInit{
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
    // 导航栏背景颜色 默认为nil
    //UIColor *barTintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.75];
    //self.navigationBar.barTintColor = barTintColor;
    // 设置导航栏的标题颜色，字体
    NSDictionary* textAttrs = @{NSForegroundColorAttributeName:Color_5E6262,
                                NSFontAttributeName:RegularFont(18),
                                };
    [self.navigationBar setTitleTextAttributes:textAttrs];
    
    // 导航栏底线的颜色/背景颜色
    [self changeNavigationBarBottomLineWithColor:UIColor.clearColor backgroundImageColor:Color_F5F8FA];
    
    // 导航栏背景颜色（不包括状态栏
    //self.navigationBar.backgroundColor = UIColor.clearColor;
    
    // 毛玻璃效果
    //self.navigationBar.translucent = NO;
    
    // barStyle 设置为白色
    //self.navigationBar.barStyle = UIBarStyleBlack;
    
    // 隐藏系统的 < 返回图标 （ 或自定义返回图标
    UIImage *image = [UIImage imageNamed:@"nav_back"];
    self.navigationBar.backIndicatorImage = image;
    self.navigationBar.backIndicatorTransitionMaskImage = image;
    
    // tint color only this can be work
    [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]] setTintColor:Color_5E6262];
}

// 由当前控制器控制
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

#pragma mark - =========================== Private Method ===================================

- (void)changeNavigationBarBottomLineWithColor:(UIColor *)bottomLineColor backgroundImageColor:(UIColor *)backgroundImageColor {
    
    // 设置导航栏的背景图片 -> 设置这个会没有系统自带毛玻璃效果
    if (!backgroundImageColor) {
        backgroundImageColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.75];
    }
    [self.navigationBar setBackgroundImage:[UIImage jz_imageWithColor:backgroundImageColor] forBarMetrics:UIBarMetricsDefault];
    
    // 底部线
    UIImage *shadowImage = [UIImage jz_imageWithColor:bottomLineColor];
    self.navigationBar.shadowImage = shadowImage;
    
    // 导航栏背景颜色（不包括状态栏
    self.navigationBar.backgroundColor = UIColor.clearColor;
    
    // 添加毛玻璃效果
    //[self inserVisualEffectView];
}

// 添加毛玻璃效果
- (void)inserVisualEffectView {
    UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    visualEfView.alpha = 0.75;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if (screenSize.width == 375.f && screenSize.height == 812.f) { // iPhone X系列
        visualEfView.frame = CGRectMake(0, -44, CGRectGetWidth(self.navigationBar.frame), 88);
    }else{
        visualEfView.frame = CGRectMake(0, 0, CGRectGetWidth(self.navigationBar.frame), CGRectGetHeight(self.navigationBar.frame));
    }
    
    [self.navigationBar insertSubview:visualEfView atIndex:0];
}

#pragma mark - =========================== Delegate =========================================
#pragma mark - UIGestureRecognizerDelegate
// override pushViewController
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
        if ([viewController isKindOfClass:[JZBaseViewController class]]) {
            JZBaseViewController *baseVc = (JZBaseViewController*)viewController;
            if ([baseVc isHidesBackButton]) {
                baseVc.navigationItem.hidesBackButton = YES;
            }else {
                baseVc.navigationItem.hidesBackButton = NO;
                NSString *backTitle = [baseVc customBackTitle];
                UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:nil action:nil];
                baseVc.navigationItem.backBarButtonItem = backItem;
            }
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backPopAction {
    [self popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /**
     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
     */
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}

// 允许同时响应多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

// 禁止响应手势 是否和ViewController中scrollView跟着滚动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer: (UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark - navigationBar
// 这个方法决定 navigationBar 是否 pop ,  （ 注意需要和self.navigationController同步，不然容易引起bug
// 当 navigationController push的时候，一定要返回NO,不能navigationBar，pop了，然后navigationController push，这样会导致不同步
// 不过如果是 navigationController为pop的话，即使返回NO，navigationBar也会pop
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    self.interactivePopGestureRecognizer.enabled = YES;
    // 左滑返回的时候也会调用，当左滑的时候，[self.viewControllers count] < [navigationBar.items count] 会等于YES
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    UIViewController *vc = [self topViewController];
    if ([vc isKindOfClass:[JZBaseViewController class]]) {
        JZBaseViewController *baseVc = (JZBaseViewController*)vc;
        return [baseVc jz_popViewController];
    }else {
        [self popViewControllerAnimated:YES];
        return YES;
    }
}

@end
