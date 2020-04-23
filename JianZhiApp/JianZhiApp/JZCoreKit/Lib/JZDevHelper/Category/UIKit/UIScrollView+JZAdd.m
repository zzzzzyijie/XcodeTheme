//
//  UIScrollView+JZAdd.m
//  JZAppDemo
//
//  Created by Jie  on 2017/7/28.
//  Copyright © 2017年 Jie . All rights reserved.
//

#import "UIScrollView+JZAdd.h"

@implementation UIScrollView (JZAdd)

- (void)jz_scrollToTopAnimated:(BOOL)animated{
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

@end
