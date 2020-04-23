//
//  NSObject+jzswizzle.h
//  JZAppDemo
//
//  Created by Jie  on 2017/8/25.
//  Copyright © 2017年 Jie . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (jzswizzle)

/**
 *  交互方法
 */
+ (void)jz_swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzleSEL forClass:(Class )clz;

/**
 *  获取某个值 for key
 */
- (id)jz_getAssociatedValueForKey:(void *)key;

/**
 *  设置strong/retain类型的值 with key
 */
- (void)jz_setAssociatedValue:(id)value withKey:(void *)key;

/**
 *  设置assign类型的值 with key
 */
- (void)jz_setAssignValue:(id)value withKey:(SEL)key;

/**
 *  移除值
 */
- (void)jz_removeAssociatedObjects;

@end
