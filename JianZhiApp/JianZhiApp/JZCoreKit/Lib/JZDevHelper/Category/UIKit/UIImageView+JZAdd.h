/*******************************************************************************\
** JZAppDemo:UIImageView+JZAdd.h
** Created by CZ(cz.devnet@gmail.com) on 2017/8/18
**
**  Copyright © 2017年 Jie . All rights reserved.
\*******************************************************************************/


#import <UIKit/UIKit.h>

@interface UIImageView (JZAdd)

/**
 *  把 UIImageView 的宽高调整为能保持 image 宽高比例不变的同时又不超过给定的 `limitSize` 大小的最大frame
 *
 *  建议在设置完x/y之后调用
 */
- (void)jz_sizeToFit:(CGSize)limitSize;

@end
