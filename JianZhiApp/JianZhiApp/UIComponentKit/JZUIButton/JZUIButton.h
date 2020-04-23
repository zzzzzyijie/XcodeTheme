//
//  JZUIButton.h
//  JZAppDemo
//
//  Created by Zengyijie' Com  on 2017/7/19.
//  Copyright © 2017年 Zengyijie' Com . All rights reserved.
//

#import <UIKit/UIKit.h>

/// 控制图片在UIButton里的位置，默认为QMUIButtonImagePositionLeft
typedef NS_ENUM(NSUInteger, JZUIButtonImagePosition) {
    JZUIButtonImagePositionTop,             // imageView在titleLabel上面
    JZUIButtonImagePositionLeft,            // imageView在titleLabel左边（默认
    JZUIButtonImagePositionBottom,          // imageView在titleLabel下面
    JZUIButtonImagePositionRight,           // imageView在titleLabel右边
};

@interface JZUIButton : UIButton

@property(nonatomic, assign) JZUIButtonImagePosition imagePosition; // 图片位置
@property(nonatomic, assign) BOOL adjustsButtonWhenHighlighted; // 是否自动调整高亮时的alpha
@property(nonatomic, strong) UIColor *highlightedBorderColor; // 高亮时的边框颜色
@property(nonatomic, strong) UIColor *highlightedBackgroundColor; // 高亮时的背景颜色
@property (nonatomic,strong) UIColor *originBorderColor; // 边框颜色
@property (nonatomic,assign) CGFloat borderWidth; // 边框宽度
@property (nonatomic,assign) CGFloat cornerRadius; // 边框圆角

@end
