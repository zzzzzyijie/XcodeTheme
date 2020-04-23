//
//  UIImage+JZAdd.h
//  OnlineClass
//
//  Created by Jie on 2017/5/12.
//  Copyright © 2017年  Jie. All rights reserved.
//

#import <UIKit/UIKit.h>

// 参考YYKit、YYCategory
@interface UIImage (JZAdd)

/**
 *  通过一个颜色生成一张图片
 */
+ ( UIImage *)jz_imageWithColor:(UIColor *)color;

/**
 *  通过一个颜色、和size生成一张指定大小的图片
 */
+ ( UIImage *)jz_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  把一个图片剪裁到指定size的图片
 */
+ (UIImage *)jz_scaleImage:(UIImage *)image toSize:(CGSize)size;

/**
 Applies a blur effect to this image. Suitable for displaying white text.
 (same as iOS Notification Center)
 */
- (UIImage *)jz_imageByBlurDark;

@end
