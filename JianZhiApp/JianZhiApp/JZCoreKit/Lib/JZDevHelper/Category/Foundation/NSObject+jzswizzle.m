//
//  NSObject+jzswizzle.m
//  JZAppDemo
//
//  Created by Jie  on 2017/8/25.
//  Copyright © 2017年 Jie . All rights reserved.
//

#import "NSObject+jzswizzle.h"
#import <objc/runtime.h>

@implementation NSObject (jzswizzle)

+ (void)jz_swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzleSEL forClass:(Class )clz{
    
    Method originalMethod = class_getClassMethod(clz, originalSEL);
    Method swizzleMethod = class_getClassMethod(clz, swizzleSEL);
    
    if (!originalSEL || !swizzleSEL) {
        return;
    }
    
    class_addMethod(
                    clz,
                    originalSEL,
                    class_getMethodImplementation(clz, originalSEL),
                    method_getTypeEncoding(originalMethod)
                    );
    
    class_addMethod(
                    clz,
                    swizzleSEL,
                    class_getMethodImplementation(clz, swizzleSEL),
                    method_getTypeEncoding(swizzleMethod)
                    );
    
    // 交换
    method_exchangeImplementations(
                                   class_getInstanceMethod(clz, originalSEL),
                                   class_getInstanceMethod(clz, swizzleSEL)
                                   );
}


- (id)jz_getAssociatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

- (void)jz_setAssociatedValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)jz_setAssignValue:(id)value withKey:(SEL)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)jz_removeAssociatedObjects {
    objc_removeAssociatedObjects(self);
}


@end
