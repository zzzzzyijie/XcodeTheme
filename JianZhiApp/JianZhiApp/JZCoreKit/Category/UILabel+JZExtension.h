//
//  UILabel+JZExtension.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JZExtension)

/** 设置字体颜色（用于扩展,方便日后适配暗黑模式 */
@property (nonatomic,strong) IBInspectable UIColor *jz_TextColor;

@end

NS_ASSUME_NONNULL_END
