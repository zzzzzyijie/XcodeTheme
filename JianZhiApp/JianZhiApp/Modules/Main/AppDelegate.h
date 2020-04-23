//
//  AppDelegate.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/9.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZTabbarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/** key window */
@property (strong, nonatomic) UIWindow *window;

/** tabbar */
@property (nonatomic,strong) JZTabbarViewController *tabBarVc;

@end

