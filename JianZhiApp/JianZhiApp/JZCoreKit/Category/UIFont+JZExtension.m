//
//  UIFont+JZExtension.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "UIFont+JZExtension.h"

static NSString *PingFangSC_Regular = @"PingFangSC-Regular";
static NSString *PingFangSC_Medium = @"PingFangSC-Medium";
static NSString *PingFangSC_Semibold = @"PingFangSC-Semibold";
@implementation UIFont (JZExtension)

// 根据屏幕适配的设置字体
+ (UIFont*)adapterRegularFontWithSize:(CGFloat)size {
    return [UIFont jz_regularFontWithSize:size*AdapterSacle];
}

+ (UIFont*)adapterMediumFontWithSize:(CGFloat)size {
    return [UIFont jz_mediumFontWithSize:size*AdapterSacle];
}

+ (UIFont*)adapterBoldFontWithSize:(CGFloat)size {
    return [UIFont jz_boldFontWithSize:size*AdapterSacle];
}

// 绝对值设置字体
+ (UIFont*)jz_regularFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:PingFangSC_Regular size:size];
}

+ (UIFont*)jz_mediumFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:PingFangSC_Medium size:size];
}

+ (UIFont*)jz_boldFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:PingFangSC_Semibold size:size];
}


@end
