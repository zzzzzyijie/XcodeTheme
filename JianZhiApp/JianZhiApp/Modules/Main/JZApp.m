//
//  JZApp.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZApp.h"
#import "AppDelegate.h"

static JZApp *_inastance = nil;
@implementation JZApp

- (instancetype)init {
    self = [super init];
    if (self) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        self.formatter = formatter;
    }
    return self;
}

#pragma mark - 单例
+(id)allocWithZone:(struct _NSZone *)zone{
    //调用dispatch_once保证在多线程中也只被实例化一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _inastance = [super allocWithZone:zone];
    });
    return _inastance;
}

+ (instancetype)shared {
    // dispatch_once_t确保初始化器只执行一次
    static dispatch_once_t oncePredicate;
    // 单例的关键，一旦类被初始化，初始化器不会再被调用
    dispatch_once(&oncePredicate, ^{
        _inastance = [[JZApp alloc] init];
    });
    return _inastance;
}

/**第4步: 保证copy时都相同*/
-(id)copyWithZone:(NSZone *)zone{
    return _inastance;
}

- (JZTabbar *)tabbar {
    AppDelegate *delegate = (AppDelegate*)UIApplication.sharedApplication.delegate;
    return (JZTabbar*)delegate.tabBarVc.tabBar;
}

@end
