//
//  UIView+JZAdd.m
//  BaibuSeller
//
//  Created by Jie on 16/4/21.
//  Copyright © 2016年 whawhawhat. All rights reserved.
//

#import "UIView+JZAdd.h"

@implementation UIView (JZAdd)

#pragma mark - Frame
// x的set和get方法
- (void)setJz_x:(CGFloat)jz_x {
    // 取出frmae
    CGRect frame = self.frame;
    // 修改
    frame.origin.x = jz_x;
    // 赋值回去
    self.frame = frame;
}

- (CGFloat)jz_x {
    return self.frame.origin.x;
}

// y的set和get方法
- (void)setJz_y:(CGFloat)jz_y {
    CGRect frame = self.frame;
    frame.origin.y = jz_y;
    self.frame = frame;
}

- (CGFloat)jz_y {
    return self.frame.origin.y;
}

// 中点的X值
- (void)setJz_centerX:(CGFloat)jz_centerX {
    CGPoint center = self.center;
    center.x = jz_centerX;
    self.center = center;
}

- (CGFloat)jz_centerX {
    return self.center.x;
}

// 中点的Y值
- (void)setJz_centerY:(CGFloat)jz_centerY {
    CGPoint center = self.center;
    center.y = jz_centerY;
    self.center = center;
}

- (CGFloat)jz_centerY {
    return self.center.y;
}

// width的set和get方法
- (void)setJz_width:(CGFloat)jz_width {
    CGRect frame = self.frame;
    frame.size.width = jz_width;
    self.frame = frame;
}

- (CGFloat)jz_width {
    return self.frame.size.width;
}

// heiht的set和get方法
- (void)setJz_height:(CGFloat)jz_height {
    CGRect frame = self.frame;
    frame.size.height = jz_height;
    self.frame = frame;
}

- (CGFloat)jz_height {
    return self.frame.size.height;
}

// size的set和get方法
- (void)setJz_size:(CGSize)jz_size {
    CGRect frame = self.frame;
    frame.size = jz_size;
    self.frame = frame;
}

- (CGSize)jz_size {
    return self.frame.size;
}

// origin的set和get方法
- (void)setJz_origin:(CGPoint)jz_origin {
    CGRect frame = self.frame;
    frame.origin = jz_origin;
    self.frame = frame;
}

- (CGPoint)jz_origin {
    return self.frame.origin;
}

// Top
- (CGFloat)jz_top{
    return self.frame.origin.y;
}

- (void)setJz_top:(CGFloat)jz_top{
    CGRect frame = self.frame;
    frame.origin.y = jz_top;
    self.frame = frame;
}

// bottom
- (CGFloat)jz_bottom{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setJz_bottom:(CGFloat)jz_bottom{
    CGRect newframe = self.frame;
    newframe.origin.y = jz_bottom - self.frame.size.height;
    self.frame = newframe;
}

// Left
- (CGFloat)jz_left{
    return self.frame.origin.x;
}

- (void)setJz_left:(CGFloat)jz_left{
    CGRect frame = self.frame;
    frame.origin.x = jz_left;
    self.frame = frame;
}

// right
- (CGFloat)jz_right{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setJz_right:(CGFloat)jz_right{
    CGFloat delta = jz_right - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta;
    self.frame = newframe;
}


- (UIViewController *)jz_currentViewController{
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark Method
- (void)jz_hideKeyBoard{
    for (UIView *_v in self.subviews) {
        [_v resignFirstResponder];
        [_v jz_hideKeyBoard];
    }
}

- (void)jz_removeAllSubviews{
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

+ (instancetype)jz_viewFromXib{   
    return  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

// do nothing 
- (instancetype)finish {
    return self;
}

@end


#pragma mark - Image Snapshot
@implementation UIView (Snapshot)

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates {
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

@end

