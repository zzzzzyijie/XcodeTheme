/*******************************************************************************\
** JZAppDemo:UINavigationController+JZAdd.h
** Created by Zengyijie(jackiezeng01@163.com) on 2017/8/18
**
**  Copyright © 2017年 Jie . All rights reserved.
\*******************************************************************************/


#import <UIKit/UIKit.h>

@interface UINavigationController (JZAdd)

- (nullable UIViewController *)jz_rootViewController;

- (nullable UIViewController *)jz_lastViewController;

- (void)setNavigationBackgroundAlpha:(CGFloat)alpha;

@end
