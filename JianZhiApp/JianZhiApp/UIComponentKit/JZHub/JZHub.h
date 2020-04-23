//
//  JZHub.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/15.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

// 这个hub是添加到 window 层上 ( 在非controller上使用
// 注意： showSuccess ，showError ， 字数不宜太长, 不然显示会不好看
NS_ASSUME_NONNULL_BEGIN

@interface JZHub : NSObject

// 成功
+ (void)showSuccess:(NSString *)message;
// 失败
+ (void)showError:(NSString *)message;

// message
+ (void)showMessage:(NSString *)message;

// loading
+ (void)mb_startLoding;

// hide
+ (void)mb_hide;

@end

NS_ASSUME_NONNULL_END
