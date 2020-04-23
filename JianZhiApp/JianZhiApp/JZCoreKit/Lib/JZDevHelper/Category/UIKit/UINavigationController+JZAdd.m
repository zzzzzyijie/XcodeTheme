/*******************************************************************************\
** JZAppDemo:UINavigationController+JZAdd.m
** Created by Zengyijie(jackiezeng01@163.com) on 2017/8/18
**
**  Copyright © 2017年 Jie . All rights reserved.
\*******************************************************************************/


#import "UINavigationController+JZAdd.h"

@implementation UINavigationController (JZAdd)

- (nullable UIViewController *)jz_rootViewController {
    return self.viewControllers.firstObject;
}

- (nullable UIViewController *)jz_lastViewController{
    return self.viewControllers.lastObject;
}

- (void)setNavigationBackgroundAlpha:(CGFloat)alpha{
    // 导航栏背景透明度设置
    UIView *barBackgroundView = [[self.navigationBar subviews] objectAtIndex:0];// _UIBarBackground
    UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0];// UIImageView
    if (self.navigationBar.isTranslucent) {
        if (backgroundImageView != nil && backgroundImageView.image != nil) {
            barBackgroundView.alpha = alpha;
        } else {
            UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = alpha;
            }
        }
    } else {
        barBackgroundView.alpha = alpha;
    }
    // 对导航栏下面那条线做处理
    self.navigationBar.clipsToBounds = alpha == 0.0;
}

@end
