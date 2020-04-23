/*******************************************************************************\
** JZAppDemo:UIImageView+JZAdd.m
** Created by CZ(cz.devnet@gmail.com) on 2017/8/18
**
**  Copyright © 2017年 Jie . All rights reserved.
\*******************************************************************************/


#import "UIImageView+JZAdd.h"

@implementation UIImageView (JZAdd)

- (void)jz_sizeToFit:(CGSize)limitSize{
    if (!self.image) {
        return;
    }
    CGSize currentSize = self.frame.size;
    if (currentSize.width <= 0) {
        currentSize.width = self.image.size.width;
    }
    if (currentSize.height <= 0) {
        currentSize.height = self.image.size.height;
    }
    CGFloat horizontalRatio = limitSize.width / currentSize.width;
    CGFloat verticalRatio = limitSize.height / currentSize.height;
    CGFloat ratio = fminf(horizontalRatio, verticalRatio);
    CGRect frame = self.frame;
    
    frame.size.width = [self sizeFlat:currentSize.width * ratio];
    frame.size.height = [self sizeFlat:currentSize.height * ratio];
    self.frame = frame;
}

- (CGFloat)sizeFlat:(CGFloat)floatValue{
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGFloat flattedValue = ceil(floatValue * scale) / scale;
    return flattedValue;
}

@end
