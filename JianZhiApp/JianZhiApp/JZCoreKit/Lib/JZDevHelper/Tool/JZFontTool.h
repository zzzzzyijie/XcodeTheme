//
//  JZFontTool.h
//  OnlineClass
//
//  Created by Jie on 2017/5/7.
//  Copyright © 2017年  Jie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JZFontTool : NSObject

/**
 *  返回系统字体size
 */
+ (UIFont *)fontWithSize:(CGFloat)size;

/**
 *  返回系统字体size
 */
+ (UIFont *)boldFontWithSize:(CGFloat)size;

/**
 *  返回指定字体的size
 */
+ (UIFont *)fontWithSize:(CGFloat)size name:(NSString *)name;

@end
