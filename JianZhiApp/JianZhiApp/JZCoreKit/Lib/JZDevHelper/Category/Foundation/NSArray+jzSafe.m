//
//  NSArray+jzSafe.m
//  OnlineClass
//
//  Created by Jie on 2017/5/14.
//  Copyright © 2017年  Jie. All rights reserved.
//

#import "NSArray+jzSafe.h"

@implementation NSArray (jzSafe)

#pragma mark - Safe
- (id)objectAt:(NSUInteger)index{
    if (index < self.count){
        return self[index];
    }else{
        return nil;
    }
}

- (id)objectAtIndexCheck:(NSUInteger)index{
    if (index >= [self count]) {
        return nil;
    }
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

@end
