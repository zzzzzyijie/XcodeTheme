//
//  JZTabbarViewController.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZTabbarViewController.h"
// Controller
#import "JZNavigationController.h"
#import "JZHomeViewController.h"
#import "JZBuyListViewController.h"
#import "JZPersonalCenterViewController.h"
// View
#import "JZTabbar.h"

@interface JZTabbarViewController ()
<
UITabBarDelegate
>

@end

@implementation JZTabbarViewController

#pragma mark - =================== Life Cycle ===================
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _setupInit];
    
    [self _setupChildVc];
    
}

- (void)_setupInit {
        
    // 自定义tabbar
    JZTabbar *tabbar = [[JZTabbar alloc] init];
    tabbar.delegate = self;
    tabbar.frame = self.tabBar.frame;
    [self setValue:tabbar forKey:@"tabBar"];
    
    /**
     *  如果要改变【顶部的横线】(self.tabBar.shadowImage）的颜色需要同时设置【self.tabBar.backgroundImage】才会生效
     *  而且这时会导致系统默认的毛玻璃效果失效，所以需要自己手动添加毛玻璃效果
     */
    //    UIColor *topLineColor = [UIColor colorWithRed:113/255.0 green:113/255.0 blue:113/255.0 alpha:1.f];
    //    [self changeTarbarTopLineWithColor:topLineColor isShadow:NO];
    
    // 去除Tabbar 顶部的横线
    //self.tabBar.clipsToBounds = YES;
    
    // 是否透明 ( 默认YES
    //self.tabBar.translucent = NO;
    
    // 选中属性
//    UIFont *tabbarFont = [UIFont systemFontOfSize:11];
    NSDictionary *normalAttributes = @{
                                       NSForegroundColorAttributeName:Color_5E6262,
                                       NSFontAttributeName:RegularFont(11)
                                       };
    [[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]] setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    
    NSDictionary *selectAttributes = @{
                                       NSForegroundColorAttributeName:AppMainColor,
                                       NSFontAttributeName:RegularFont(11)
                                       };
    [[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]] setTitleTextAttributes:selectAttributes forState:UIControlStateSelected];
}

#pragma mark - ============== Private Method ============

- (void)_setupChildVc {
    
    // 首页
    JZHomeViewController *home = [[JZHomeViewController alloc] init];
    [self addChildViewController:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_select" index:0];
    
    // 书院
    JZBuyListViewController *book = [[JZBuyListViewController alloc] init];
    [self addChildViewController:book title:@"书院" image:@"tabbar_book" selectedImage:@"tabbar_book_select" index:1];
    
    // 播放 ( 这里即使不显示，也要传
    JZBuyListViewController *play = [[JZBuyListViewController alloc] init];
    [self addChildViewController:play title:@"title" image:@"tabbar_book" selectedImage:@"tabbar_book_select" index:2];
    
    // 我的已购
    JZBuyListViewController *buyList = [[JZBuyListViewController alloc] init];
    [self addChildViewController:buyList title:@"已购" image:@"tabbar_buylist" selectedImage:@"tabbar_buylist_select" index:3];
    
    // 个人中心
    JZPersonalCenterViewController *personal = [[JZPersonalCenterViewController alloc] init];
    [self addChildViewController:personal title:@"我的" image:@"tabbar_my" selectedImage:@"tabbar_my_select" index:4];
    
    // 这垃圾Xcode
}

- (void)addChildViewController:(JZBaseViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage index:(NSInteger)index {
    // Title
    childVc.navigationItem.title = title;
    childVc.tabBarItem.title = title;
    
    // image
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *selectImageObj = [UIImage imageNamed:selectedImage];
    childVc.tabBarItem.selectedImage = [selectImageObj imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // Insets、index
    if (iPhoneXSeries) {
        childVc.tabBarItem.imagePositionAdjustment = UIOffsetMake(0, 2);
        childVc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 2);
    }else {
        childVc.tabBarItem.imagePositionAdjustment = UIOffsetMake(0, -2);
        childVc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    }
    childVc.tabBarItem.indexForController = index;
    
    // Nav
    JZNavigationController *nav = [[JZNavigationController alloc] initWithRootViewController:childVc];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:nil];
    childVc.navigationItem.backBarButtonItem = backItem;
    
    // Add ChildVc
    [self addChildViewController:nav];
}


- (void)tabBar:(JZTabbar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (tabBar.currentIndex == 2) {
        // 播放
        JZLog(@"播放");
    }else {
        self.selectedIndex = tabBar.currentIndex;
        [tabBar tabbarItemDidSelect:tabBar.currentIndex];
    }
}

@end
