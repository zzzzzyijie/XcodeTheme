//
//  UIViewController+JZExtension
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JZExtension)

#pragma mark - ============== Some Method ============
// 返回到指定控制器
- (void)backToViewControllWithClass:(Class)cls withSEL:(nullable SEL)sel param:(nullable id)param;

#pragma mark - ============== Hub ============
// Hub
#pragma marl - Hit
// 默认添加到self.view上
- (void)jz_showHint:(nullable NSString *)hint;
// 添加到主窗口上
- (void)jz_showHintInkeyWindow:(nullable NSString *)hint;
// 添加到自定义的view上
- (void)jz_showHint:(nullable NSString *)hint inView:(UIView *)view;

#pragma marl - Loading
// 默认添加到self.view上
- (void)jz_loadWithText:(nullable NSString *)text;
// 添加到主窗口上
- (void)jz_loadWithTextInkeyWindow:(nullable NSString *)text;
// 添加到自定义的view上
- (void)jz_loadWithText:(nullable NSString *)text inView:(UIView *)view;

#pragma marl - Error
// 默认添加到self.view上
- (void)jz_showWithError:(NSError *)error;

#pragma marl - Hide
- (void)jz_hide;

// to do ( show succes style , need a icon

@end

NS_ASSUME_NONNULL_END
