//
//  JZApp.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JZTabbar;
// App全局单例，存放一些全局的对象或变量，但不要滥用
#define App [JZApp shared] // JZApp实例

NS_ASSUME_NONNULL_BEGIN
// 全局的一些配置, 属性；
@interface JZApp : NSObject

+ (instancetype)shared;

/**
 *  全局的formatter (注意设置后的改变
 *  NSDateFormatter消耗的性能较高，所以定义一个全局的单例
 */
@property (nonatomic,strong) NSDateFormatter *formatter;

// Tabbar
@property (nonatomic,strong,readonly) JZTabbar *tabbar;


@end

NS_ASSUME_NONNULL_END
