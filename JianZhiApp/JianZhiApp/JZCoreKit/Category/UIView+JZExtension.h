//
//  UIView+JZExtension.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JZExtension)

/** 设置背景颜色（用于扩展,方便日后适配暗黑模式 */
@property (nonatomic,strong) UIColor *jz_BackgroundColor;

// 给view添加圆角 ( 前提是self.frame有值
- (void)jz_addCorner:(CGFloat)radius byRoundingType:(UIRectCorner)type;

// 给view添加有圆角的layer
- (void)jz_addCorner:(CGFloat)radius byRoundingType:(UIRectCorner)type withRect:(CGRect)layerRect;

/// 给一个view添加渐变颜色，调用这个的前提是self.bounds要有值 ( 渐变色占满整个view,默认从左到右
/// @param colors 渐变颜色数组
- (void)jz_addGradientColors:(NSArray<UIColor *> *)colors;

/// 给一个view添加渐变颜色 (默认从左到右
/// @param colors 渐变颜色数组
- (void)jz_addGradientColors:(NSArray<UIColor *> *)colors size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
