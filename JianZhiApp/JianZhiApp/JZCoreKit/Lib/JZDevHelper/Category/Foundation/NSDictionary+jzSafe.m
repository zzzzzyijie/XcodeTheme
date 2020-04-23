 //
//  NSDictionary+jzSafe.m
//  NSDictIonaryTest
//
//  Created by  Jie on 17/3/14.
//  Copyright © 2017年  Jie. All rights reserved.
//

#import "NSDictionary+jzSafe.h"
#import <objc/runtime.h>
#import "NSObject+jzswizzle.h"
/**
 *  来自： https://github.com/allenhsu/NSDictionary-NilSafe
 */
@implementation NSDictionary (jzSafe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self jz_swizzleSEL:@selector(initWithObjects:forKeys:) withSEL:@selector(jz_initWithObjects:forKeys:count:) forClass:object_getClass(self)];
        [self jz_swizzleSEL:@selector(dictionaryWithObjects:forKeys:count:) withSEL:@selector(jz_dictionaryWithObjects:forKeys:count:) forClass:object_getClass(self)];
    });
}


- (instancetype)jz_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSInteger index = 0; index < cnt; index++) {
        id key = keys[index];
        id obj = objects[index];
        if (!key || !obj) {
            continue;
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self jz_initWithObjects:safeObjects forKeys:safeKeys count:j];
}


+ (instancetype)jz_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt{
    
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSInteger index = 0; index < cnt; index++) {
        id key = keys[index];
        id obj = objects[index];
        if (!key || !obj) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self jz_dictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}


@end


@implementation NSMutableDictionary (jzSafe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        ## Class class = object_getClass(self); 这样则交换不了
        Class class = NSClassFromString(@"__NSDictionaryM");
        [self jz_swizzleSEL:@selector(setObject:forKey:) withSEL:@selector(jz_setObject:forKey:) forClass:class];
        [self jz_swizzleSEL:@selector(setObject:forKeyedSubscript:) withSEL:@selector(jz_setObject:forKeyedSubscript:) forClass:class];
    });
}

- (void)jz_setObject:(id)anObject forKey:(id<NSCopying>)aKey{

    if (!aKey) {
        return;
    }
    if (!anObject) {
        //anObject = @""; // 这个会出现bug
        return;
    }
    [self jz_setObject:anObject forKey:aKey];
}

- (void)jz_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key{

    if (!key) {
        return;
    }
    if (!obj) {
        //obj = @""; // 这个会出现bug
        return;
    }
    [self jz_setObject:obj forKeyedSubscript:key];
}


@end


