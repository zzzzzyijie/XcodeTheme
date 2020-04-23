//
//  UIView+JZExtension.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "UIView+JZExtension.h"

@implementation UIView (JZExtension)

- (void)setJz_BackgroundColor:(UIColor *)jz_BackgroundColor {
    self.backgroundColor = jz_BackgroundColor;
}

- (UIColor *)jz_BackgroundColor {
    return self.backgroundColor;
}

- (void)jz_addCorner:(CGFloat)radius byRoundingType:(UIRectCorner)type {
    [self jz_addCorner:radius byRoundingType:type withRect:self.bounds];
}

// 给view添加有圆角的layer
- (void)jz_addCorner:(CGFloat)radius byRoundingType:(UIRectCorner)type withRect:(CGRect)layerRect {
    CGSize cornerRadius = CGSizeMake(radius, radius);
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layerRect byRoundingCorners:type cornerRadii:cornerRadius];
    layer.path = path.CGPath;
    layer.frame = layerRect;
    self.layer.mask = layer;
}

- (void)jz_addGradientColors:(NSArray<UIColor *> *)colors {
    [self jz_addGradientColors:colors size:self.bounds.size];
}

/// 给一个view添加渐变颜色 (默认从左到右
/// @param colors 渐变颜色数组
- (void)jz_addGradientColors:(NSArray<UIColor *> *)colors size:(CGSize)size {
    if (!self || colors.count <= 0) { return; }

    CGFloat layerW = self.bounds.size.width;
    CGFloat layerH = self.bounds.size.height;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSMutableArray *cgColors = @[].mutableCopy;
    for (UIColor *color in colors) {
        [cgColors addObject:(__bridge id)color.CGColor];
    }
    gradientLayer.colors = cgColors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@(0.0f) ,@(1.0f)];
    gradientLayer.frame = CGRectMake(0, 0, layerW, layerH);
    if (!gradientLayer.superlayer) {
        [self.layer insertSublayer:gradientLayer below:self.layer.sublayers.firstObject];
    }
}

@end
