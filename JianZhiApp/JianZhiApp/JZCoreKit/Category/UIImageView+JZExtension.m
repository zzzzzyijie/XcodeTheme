//
//  UIImageView+JZExtension.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "UIImageView+JZExtension.h"
#import <SDWebImage/SDWebImage.h>

@implementation UIImageView (JZExtension)

// 带有占位图
- (void)jz_setImageWithUrl:(NSString *)url {
#warning to do
    UIImage *placeHolder = [UIImage imageNamed:@""]; // 这里统一设置占位图
    [self jz_setImageWithUrl:url placeholderImage:placeHolder];
}

// 自定义占位图
- (void)jz_setImageWithUrl:(NSString *)url placeholderImage:(nullable UIImage *)placeHolderImage {
    if (!url) { return; }
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeHolderImage];
}


// 根据url (key) 获取网络图片, 适应size、裁剪并缓存  （ 这里扩展设置边框、颜色等
- (void)jz_setImageWithUrl:(NSString *)url targetSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage *)placeHolderImage {
    if (!url) { return; }
    if (size.width <= 0 || size.height <= 0) { return; }
    
    NSString *cacheName = [url stringByAppendingString:[NSString stringWithFormat:@"/corner/%zd_%zd",(NSInteger)size.width,(NSInteger)size.height]];
 
    // 从缓存里面获取
    UIImage *cacheIamge = [[SDImageCache sharedImageCache] imageFromCacheForKey:cacheName];
    if (cacheIamge) {
        self.image = cacheIamge;
        return;
    }
    
    // 手动下载
//    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
//        if (image) {
//            image = [[UIImage jz_scaleImage:image toSize:size] yy_imageByRoundCornerRadius:cornerRadius];
//            // memory , disk 同时缓存
//            [[SDImageCache sharedImageCache] storeImage:image forKey:cacheName completion:NULL];
//            self.image = image;
//        }else {
//            self.image = placeHolderImage;
//        }
//    }];
    // SDWebImageDelayPlaceholder 请求完成才显示占位图
    SDWebImageOptions options = SDWebImageRetryFailed | SDWebImageAvoidAutoSetImage;
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeHolderImage options:options completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image) {
            image = [[UIImage jz_scaleImage:image toSize:size] yy_imageByRoundCornerRadius:cornerRadius];
            // 首先移除原来的，然后把新的，memory , disk 同时缓存
            [[SDImageCache sharedImageCache] removeImageForKey:url withCompletion:NULL];
            [[SDImageCache sharedImageCache] storeImage:image forKey:cacheName completion:NULL];
            self.image = image;
        }else {
            self.image = placeHolderImage;
        }
    }];
}

@end
