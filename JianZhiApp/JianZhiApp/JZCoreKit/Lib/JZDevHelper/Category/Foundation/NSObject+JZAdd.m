/*******************************************************************************\
** JZDevHelperDemo:NSObject+JZAdd.m
** Created by Zengyijie(jackiezeng01@163.com) on 2018/11/22
**
**Copyright © 2018 www.noname.com. All rights reserved.
\*******************************************************************************/


#import "NSObject+JZAdd.h"

@implementation NSObject (JZAdd)
- (BOOL)jz_isEmpty{
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]){
        return YES;
    }
    if ([self isKindOfClass:[NSString class]]) {
        if ([[(NSString*)self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
            return YES;
        }
    }
    if ([self isKindOfClass:[NSDictionary class]]) {
        if ([(NSDictionary*)self count] <= 0) {
            return YES;
        }
    }
    
    if ([self isKindOfClass:[NSArray class]]) {
        if ([(NSArray*)self count] <= 0) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isNilOrNull {
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

- (BOOL)isNotNilOrNull {
    return !self.isNilOrNull;
}

/**
 *  返回当前class name
 */
+ (NSString *)currentClassName {
    return NSStringFromClass([self class]);
}

@end


#pragma mark - 默认值（orEmpty）
@implementation NSString (Empty)

- (NSString *)orEmpty {
    if (self.isNotNilOrNull && [self isKindOfClass:[NSString class]]) {
        return self;
    }
    return @"";
}

@end

@implementation NSArray (Empty)

- (NSArray *)orEmpty {
    if (self.isNotNilOrNull && [self isKindOfClass:[NSArray class]]) {
        return self;
    }
    return @[];
}

@end

@implementation NSDictionary (Empty)

- (NSDictionary *)orEmpty {
    if (self.isNotNilOrNull && [self isKindOfClass:[NSDictionary class]]) {
        return self;
    }
    return @{};
}

@end


