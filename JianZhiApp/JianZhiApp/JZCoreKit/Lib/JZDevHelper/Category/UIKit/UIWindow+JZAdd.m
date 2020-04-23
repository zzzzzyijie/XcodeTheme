//
//  UIWindow+JZAdd.m
//  JZAppDemo
//
//  Created by Jie  on 2018/9/8.
//  Copyright © 2018年 Jie . All rights reserved.
//

#import "UIWindow+JZAdd.h"

@implementation UIWindow (JZAdd)

- (UIViewController *)jz_currentViewController{
    
    UIViewController *topController = [self rootViewController];
    
    while ([topController presentedViewController]){
         topController = [topController presentedViewController];
    }
    if ([topController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarVc = (UITabBarController*)topController;
        topController = tabBarVc.selectedViewController;
    }
    while ([topController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)topController topViewController]){
        topController = [(UINavigationController*)topController topViewController];
    }
    return topController;
}

@end
