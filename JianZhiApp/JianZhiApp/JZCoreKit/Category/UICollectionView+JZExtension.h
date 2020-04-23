//
//  UICollectionView+JZExtension.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/15.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JZRegisterKind) { // 类型
    Header,
    Footer
};
NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (JZExtension)

#pragma mark - Cell
/*
 *  nibName为Xib名称，同时也为reuseIdentifier
 */
- (void)jz_registerNib:(NSString *)nibName;

/*
 *  className为Xcell class，同时也为reuseIdentifier
 */
- (void)jz_registerClass:(Class )className;

#pragma mark - Header & Footer
/*
 *  nibName为Xib名称，同时也为reuseIdentifier
 */
- (void)jz_registerHeaderFooterNib:(NSString *)nibName kind:(JZRegisterKind)kind;

/*
 *  className为Xcell class，同时也为reuseIdentifier
 */
- (void)jz_registerHeaderFooterClass:(Class )className kind:(JZRegisterKind)kind;

@end

NS_ASSUME_NONNULL_END
