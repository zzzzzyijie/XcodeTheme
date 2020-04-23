//
//  UIViewController+ConfigNavItem.h
//  CashierKeeper
//
//  Created by Zengyijie' Com  on 2018/12/5.
//  Copyright © 2018 MoJang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ConfigNavItem)

#pragma mark - Back NavigationItem
- (void)jz_setupBackItem;
- (void)jz_setupLeftBackItem;
- (void)jz_hideBackItem; // 隐藏backItem

#pragma mark - Left NavigationItem
// image
- (UIButton *)jz_setupLeftItemWithImageName:(NSString *)imageName selector:(SEL)sel;

- (UIButton *)jz_setupLeftItemWithImageName:(NSString *)imageName imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets selector:(SEL)sel;

- (UIButton *)jz_setupLeftItemWithImageName:(NSString *)imageName imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets itemSize:(CGSize)itemSize selector:(SEL)sel;

// title
- (UIButton *)jz_setupLeftItemWithTitle:(NSString *)title color:(UIColor *)color selector:(SEL)sel;

- (UIButton *)jz_setupLeftItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font selector:(SEL)sel;

- (UIButton *)jz_setupLeftItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets selector:(SEL)sel;

- (UIButton *)jz_setupLeftItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets  itemSize:(CGSize)itemSize selector:(SEL)sel;

#pragma mark - Right NavigationItem
// image
- (UIButton *)jz_setupRightItemWithImageName:(NSString *)imageName selector:(SEL)sel;

- (UIButton *)jz_setupRightItemWithImageName:(NSString *)imageName imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets selector:(SEL)sel;

- (UIButton *)jz_setupRightItemWithImageName:(NSString *)imageName imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets itemSize:(CGSize)itemSize selector:(SEL)sel;

// title
- (UIButton *)jz_setupRightItemWithTitle:(NSString *)title color:(UIColor *)color selector:(SEL)sel;

- (UIButton *)jz_setupRightItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font selector:(SEL)sel;

- (UIButton *)jz_setupRightItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets  selector:(SEL)sel;

- (UIButton *)jz_setupRightItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets  itemSize:(CGSize)itemSize selector:(SEL)sel;


#pragma mark - TitleView NavigationItem
- (void)jz_setupNavTitle:(NSString *)title;

#pragma mark - Pop & Dismiss
- (BOOL)jz_popViewController;

- (void)jz_dismissViewController;

@end

NS_ASSUME_NONNULL_END
