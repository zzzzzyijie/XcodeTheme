//
//  NSDictionary+Unicode.m
//  OnlineClass
//
//  Created by  Jie on 17/5/22.
//  Copyright © 2017年  Jie. All rights reserved.
//

#import "NSDictionary+Unicode.h"

/**
 *  参考来自网上
 */

@implementation NSDictionary (Unicode)

+ (void)load {
#if JZDEBUG
    [self jz_swizzleSEL:@selector(description) withSEL:@selector(my_description) forClass:[self class]];
    [self jz_swizzleSEL:@selector(descriptionWithLocale:) withSEL:@selector(my_descriptionWithLocale:) forClass:[self class]];
#else
#endif
}

- (NSString*)my_description {
    NSString *desc = [self my_description];
    return [self changeToUnicodeString:desc];
}

- (NSString *)changeToUnicodeString:(NSString *)desc {
    return [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
}

- (NSString *)my_descriptionWithLocale:(id)locale {
    if (![self isKindOfClass:[NSDictionary class]]) {
        return @"";
    }
    if (self[@"UIKeyboardAnimationCurveUserInfoKey"]) { // 键盘
        return @"UIKeyboardAnimationCurveUserInfoKey";
    }
    if (self[@"PHImageFileOrientationKey"]) { // 相册
        return @"PHImageFileOrientationKey";
    }
    
    NSString *string;
    @try {
        NSData *data;
        @try {
            data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
        } @catch (NSException *exception) {
            NSString *reason = [NSString stringWithFormat:@"reason:%@",exception.reason];
            string = [NSString stringWithFormat:@"Log Error:\n%@,\n description:\n%@",reason,self.description];
        }@finally {
            
        }
        if (data) {
            string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    } @catch (NSException *exception) {
        NSString *reason = [NSString stringWithFormat:@"reason:%@",exception.reason];
        string = [NSString stringWithFormat:@"Log Error:\n%@,\n description:\n%@",reason,self.description];
        
    } @finally {
        
    }
    
    return string;
}

@end


@implementation NSArray (Unicode)

+ (void)load {
#if DEBUG
//    [self jz_swizzleSEL:@selector(description) withSEL:@selector(my_description) forClass:[self class]];
//    [self jz_swizzleSEL:@selector(descriptionWithLocale:) withSEL:@selector(my_descriptionWithLocale:) forClass:[self class]];
#else
#endif
}

- (NSString*)my_description {
    NSString *desc = [self my_description];
    desc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return desc;
}

- (NSString *)my_descriptionWithLocale:(id)locale {
//    return [self my_description];
    NSMutableString *string = [NSMutableString string];

    // 开头有个[
    [string appendString:@"[\n"];

    // 遍历所有的元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@,\n", obj];
    }];

    // 结尾有个]
    [string appendString:@"]"];

    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];

    return string;
}

@end





