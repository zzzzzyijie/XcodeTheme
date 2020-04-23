//
//  UIFont+JZExtension.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (JZExtension)

// 根据屏幕适配的设置字体
+ (UIFont *)adapterRegularFontWithSize:(CGFloat)size;
+ (UIFont *)adapterMediumFontWithSize:(CGFloat)size;
+ (UIFont *)adapterBoldFontWithSize:(CGFloat)size;

// 绝对值设置字体
+ (UIFont *)jz_regularFontWithSize:(CGFloat)size;
+ (UIFont *)jz_mediumFontWithSize:(CGFloat)size;
+ (UIFont *)jz_boldFontWithSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
