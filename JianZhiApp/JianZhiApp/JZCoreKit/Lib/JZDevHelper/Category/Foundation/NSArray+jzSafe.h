//
//  NSArray+jzSafe.h
//  OnlineClass
//
//  Created by Jie on 2017/5/14.
//  Copyright © 2017年  Jie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (jzSafe)

#pragma mark - Safe
- (id)objectAt:(NSUInteger)index;
- (id)objectAtIndexCheck:(NSUInteger)index;

@end
