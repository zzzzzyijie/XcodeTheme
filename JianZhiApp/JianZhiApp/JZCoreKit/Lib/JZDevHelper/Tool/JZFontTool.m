//
//  JZFontTool.m
//  OnlineClass
//
//  Created by Jie on 2017/5/7.
//  Copyright © 2017年  Jie. All rights reserved.
//

#import "JZFontTool.h"

@implementation JZFontTool

+ (UIFont *)fontWithSize:(CGFloat)size{
    UIFont *f;
    // 以6s为设置稿
    if (iPhone55Inch || (JZScreenHeight == 896.0f)) { // plus / xr / max
        f = [UIFont systemFontOfSize:(size+1)];
    }else if (JZScreenWidth == 375.0f) { // 6s , x , xs
        f = [UIFont systemFontOfSize:size];
    }else { // 5s ..
        f = [UIFont systemFontOfSize:size-2];
    }
    return f;
}

/**
 *  返回系统字体size
 */
+ (UIFont *)boldFontWithSize:(CGFloat)size {
    UIFont *f;
    // 以6s为设置稿
    if (iPhone55Inch || (JZScreenHeight == 896.0f)) { // plus / xr / max
        f = [UIFont boldSystemFontOfSize:(size+1)];
    }else if (JZScreenWidth == 375.0f) { // 6s , x , xs
        f = [UIFont boldSystemFontOfSize:size];
    }else { // 5s ..
        f = [UIFont boldSystemFontOfSize:size-2];
    }
    return f;
}

+ (UIFont *)fontWithSize:(CGFloat)size name:(NSString *)name {
    return [UIFont fontWithName:name size:size];
}

@end
