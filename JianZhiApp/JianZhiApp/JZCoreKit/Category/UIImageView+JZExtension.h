//
//  UIImageView+JZExtension.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (JZExtension)

/**
 *  带有占位图
 */

- (void)jz_setImageWithUrl:(NSString *)url;

/**
 *  自定义占位图
 */
- (void)jz_setImageWithUrl:(NSString *)url placeholderImage:(nullable UIImage *)placeHolderImage;


/**
 *  根据url (key) 获取网络图片, 适应size、裁剪并缓存
 */
- (void)jz_setImageWithUrl:(NSString *)url targetSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage *)placeHolderImage;


@end

NS_ASSUME_NONNULL_END
