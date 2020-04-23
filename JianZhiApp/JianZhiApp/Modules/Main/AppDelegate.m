//
//  AppDelegate.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/9.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupWindow];
    
    return YES;
}

- (void)setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.blackColor;
    //ViewController *homeVc = [[ViewController alloc] init];
    //self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:homeVc];
    self.tabBarVc = [[JZTabbarViewController alloc] init];
    self.window.rootViewController = self.tabBarVc;
    [self.window makeKeyAndVisible];
    // change it 
}

@end
