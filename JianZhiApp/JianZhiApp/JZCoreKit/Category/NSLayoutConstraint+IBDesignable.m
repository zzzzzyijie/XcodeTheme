//
//  NSLayoutConstraint+IBDesignable.m
//  TestMasornyDemo
//
//  Created by 曾一桀 on 2019/6/5.
//  Copyright © 2019  曾一桀. All rights reserved.
//

#import "NSLayoutConstraint+IBDesignable.h"

@implementation NSLayoutConstraint (IBDesignable)

- (void)setAdapterScreen:(BOOL)adapterScreen {
    if (adapterScreen){
        self.constant = self.constant * AdapterSacle;
    }
}

- (BOOL)adapterScreen{ // 没有使用
    return NO;
}

@end
