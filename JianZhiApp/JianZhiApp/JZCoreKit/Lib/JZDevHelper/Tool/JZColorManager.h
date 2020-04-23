//
//  JZColorManager.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/22.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JZColorManager : NSObject

// ---生成主题颜色的渐变图片---
// 正常
+ (UIImage *)getButtonRuglarThemeGradientImageWithSize:(CGSize)size;
// 按下
+ (UIImage *)getButtonTouchDownImageWithSize:(CGSize)size;
// 不可点
+ (UIImage *)getButtonDisabledImageWithSize:(CGSize)size;

// ---生成泛黄颜色的渐变图片---
// 正常
+ (UIImage *)getButtonRuglarYellowGradientImageWithSize:(CGSize)size;
// 按下
+ (UIImage *)getButtonTouchDownYellowImageWithSize:(CGSize)size;
// 不可点
+ (UIImage *)getButtonDisabledYellowImageWithSize:(CGSize)size;

// 根据颜色数组生成图片
+ (UIImage *)getGradientImageWithColors:(NSArray<UIColor *> *)colors size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
