//
//  JZColorManager.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/22.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZColorManager.h"

@implementation JZColorManager

// 正常
+ (UIImage *)getButtonRuglarThemeGradientImageWithSize:(CGSize)size {
    return [self getGradientImageWithColors:@[Color_0BCECE,Color_2DDCDC] size:size];
}

// 按下
+ (UIImage *)getButtonTouchDownImageWithSize:(CGSize)size {
    return [UIImage jz_imageWithColor:[UIColor jz_colorWithHexString:@"#0AB9B9"] size:size];
}

// 不可点
+ (UIImage *)getButtonDisabledImageWithSize:(CGSize)size {
    return [UIImage jz_imageWithColor:[UIColor jz_colorWithHexString:@"#82DCDC"] size:size];
}

// ---生成泛黄颜色的渐变图片---
// 正常
+ (UIImage *)getButtonRuglarYellowGradientImageWithSize:(CGSize)size {
    return [self getGradientImageWithColors:@[Color_FADCAA,Color_E1AF55] size:size];
}

// 按下
+ (UIImage *)getButtonTouchDownYellowImageWithSize:(CGSize)size {
    return [UIImage jz_imageWithColor:[UIColor jz_colorWithHexString:@"#C8A04B"] size:size];
}

// 不可点
+ (UIImage *)getButtonDisabledYellowImageWithSize:(CGSize)size {
    return [UIImage jz_imageWithColor:[UIColor jz_colorWithHexString:@"#F0D7AA"] size:size];
}

+ (UIImage *)getGradientImageWithColors:(NSArray<UIColor *> *)colors size:(CGSize)size {
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSMutableArray *cgColors = @[].mutableCopy;
    for (UIColor *color in colors) {
        [cgColors addObject:(__bridge id)color.CGColor];
    }
    gradientLayer.colors = cgColors;
    gradientLayer.locations = @[@(0.0f), @(1.0f)];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
//    if (directionType == WHLinearGradientDirectionLevel) {
//    }else if (directionType == right){
//        gradientLayer.startPoint = CGPointMake(0, 0);
//        gradientLayer.endPoint = CGPointMake(0, 1);
//    }else if (directionType == up){
//        gradientLayer.startPoint = CGPointMake(0, 0);
//        gradientLayer.endPoint = CGPointMake(1, 1);
//    }else if (directionType == down){
//        gradientLayer.startPoint = CGPointMake(0, 1);
//        gradientLayer.endPoint = CGPointMake(1, 0);
//    }
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, NO, 0);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return gradientImage;
}

@end
