//
//  ColorFontMacro.h
//  JZAppDemo
//
//  Created by Jie  on 2017/7/14.
//  Copyright © 2017年 Jie . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorFontMacro : NSObject

// RGB 、随机颜色 
#define JZRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define JZRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JZRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 基础颜色
#define JZColorClear                [UIColor clearColor]
#define JZColorWhite                [UIColor whiteColor]
#define JZColorBlack                [UIColor blackColor]
#define JZColorGray                 [UIColor grayColor]
#define JZColorGrayLighten          [UIColor darkGrayColor]
#define JZColorRed                  [UIColor redColor]
#define JZColorGreen                [UIColor greenColor]
#define JZColorBlue                 [UIColor blueColor]
#define JZColorYellow               [UIColor yellowColor]

@end
