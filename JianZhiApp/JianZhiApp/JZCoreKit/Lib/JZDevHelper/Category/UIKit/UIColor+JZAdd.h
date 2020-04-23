//
//  UIColor+JZAdd.h
//  OnlineClass
//
//  Created by Jie on 2017/5/12.
//  Copyright © 2017年  Jie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JZAdd)

/**
 *  通过HEX命名方式的颜色字符串生成一个UIColor对象
 */
+ ( UIColor *)jz_colorWithHexString:(NSString *)hexStr;

/**
 *  将自身变化到0.15程度的黑色（适度高亮变化）
 */
- (UIColor *)jz_highlightedColor;

/**
 *  将自身变化到某个目标颜色，可通过参数progress控制变化的程度，最终得到一个纯色
 *  @param toColor 目标颜色
 *  @param progress 变化程度，取值范围0.0f~1.0f
 */
- (UIColor *)jz_transitionToColor:(UIColor *)toColor progress:(CGFloat)progress;

/**
 *  将颜色A变化到颜色B，可通过progress控制变化的程度
 *  @param fromColor 起始颜色
 *  @param toColor 目标颜色
 *  @param progress 变化程度，取值范围0.0f~1.0f
 */
+ (UIColor *)jz_colorFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor progress:(CGFloat)progress;

@end
