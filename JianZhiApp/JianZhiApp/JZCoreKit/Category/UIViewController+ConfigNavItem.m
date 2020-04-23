//
//  UIViewController+ConfigNavItem.m
//  CashierKeeper
//
//  Created by Zengyijie' Com  on 2018/12/5.
//  Copyright © 2018 MoJang. All rights reserved.
//

#import "UIViewController+ConfigNavItem.h"
#import "JZBaseViewController.h"

@implementation UIViewController (ConfigNavItem)

#pragma  - Back NavigationItem
- (void)jz_setupBackItem {
//    if ([self isKindOfClass:[JZBaseViewController class]]) {
//        JZBaseViewController *baseVc = (JZBaseViewController*)self;
//        NSString *backTitle = [baseVc customBackTitle];
//        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:nil action:nil];
//        baseVc.navigationItem.backBarButtonItem = backItem;
//    }
}

- (void)jz_hideBackItem {
//    if ([self isKindOfClass:[JZBaseViewController class]]) {
//        JZBaseViewController *baseVc = (JZBaseViewController*)self;
//        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(jz_popViewController)];
//        baseVc.navigationItem.backBarButtonItem = backItem;
//    }
}

- (void)jz_setupLeftBackItem {
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    itemBtn.frame = CGRectMake(0, 0, 44, 44);
    UIImage *image = [UIImage imageNamed:@"nav_back"];
    [itemBtn setImage:image forState:UIControlStateNormal];
    [itemBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
    itemBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [itemBtn addTarget:self action:@selector(jz_popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    self.navigationItem.leftBarButtonItem = item;
}

#pragma  - Left NavigationItem
// image
- (UIButton *)jz_setupLeftItemWithImageName:(NSString *)imageName selector:(SEL)sel {
    return [self jz_setupLeftItemWithImageName:imageName imageEdgeInsets:UIEdgeInsetsZero selector:sel];
}

- (UIButton *)jz_setupLeftItemWithImageName:(NSString *)imageName imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets selector:(SEL)sel {
    return [self jz_setupLeftItemWithImageName:imageName imageEdgeInsets:imageEdgeInsets itemSize:CGSizeMake(60.f, 60.f) selector:sel];
}

- (UIButton *)jz_setupLeftItemWithImageName:(NSString *)imageName imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets itemSize:(CGSize)itemSize selector:(SEL)sel {
    return [self jz_setupItemWithImageName:imageName title:nil color:nil font:nil titleEdgeInsets:UIEdgeInsetsZero imageEdgeInsets:imageEdgeInsets selector:sel itemSize:itemSize direction:@"left"];
}

// title
- (UIButton *)jz_setupLeftItemWithTitle:(NSString *)title color:(UIColor *)color selector:(SEL)sel {
    return [self jz_setupLeftItemWithTitle:title color:color font:[UIFont systemFontOfSize:14] selector:sel];
}

- (UIButton *)jz_setupLeftItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font selector:(SEL)sel {
    return [self jz_setupLeftItemWithTitle:title color:color font:font titleEdgeInsets:UIEdgeInsetsZero selector:sel];
}

- (UIButton *)jz_setupLeftItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets selector:(SEL)sel {
    return [self jz_setupLeftItemWithTitle:title color:color font:font titleEdgeInsets:titleEdgeInsets itemSize:CGSizeMake(60.f, 60.f) selector:sel];
}

- (UIButton *)jz_setupLeftItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets  itemSize:(CGSize)itemSize selector:(SEL)sel {
    return [self jz_setupItemWithImageName:nil title:title color:color font:font titleEdgeInsets:titleEdgeInsets imageEdgeInsets:UIEdgeInsetsZero selector:sel itemSize:itemSize direction:@"left"];
}


#pragma  - Right NavigationItem
// image
- (UIButton *)jz_setupRightItemWithImageName:(NSString *)imageName selector:(SEL)sel {
    return [self jz_setupRightItemWithImageName:imageName imageEdgeInsets:UIEdgeInsetsZero selector:sel];
}

- (UIButton *)jz_setupRightItemWithImageName:(NSString *)imageName imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets selector:(SEL)sel {
    return [self jz_setupRightItemWithImageName:imageName imageEdgeInsets:imageEdgeInsets itemSize:CGSizeMake(60.f, 60.f) selector:sel];
}

- (UIButton *)jz_setupRightItemWithImageName:(NSString *)imageName imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets itemSize:(CGSize)itemSize selector:(SEL)sel {
    return [self jz_setupItemWithImageName:imageName title:nil color:nil font:nil titleEdgeInsets:UIEdgeInsetsZero imageEdgeInsets:imageEdgeInsets selector:sel itemSize:itemSize direction:@"right"];
}

// title
- (UIButton *)jz_setupRightItemWithTitle:(NSString *)title color:(UIColor *)color selector:(SEL)sel {
   return [self jz_setupRightItemWithTitle:title color:color font:[UIFont systemFontOfSize:14] selector:sel];
}

- (UIButton *)jz_setupRightItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font selector:(SEL)sel {
    return [self jz_setupRightItemWithTitle:title color:color font:font titleEdgeInsets:UIEdgeInsetsZero selector:sel];
}

- (UIButton *)jz_setupRightItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets selector:(SEL)sel {
    return [self jz_setupRightItemWithTitle:title color:color font: font titleEdgeInsets: titleEdgeInsets itemSize: CGSizeMake(60.f, 60.f) selector:sel];
}

- (UIButton *)jz_setupRightItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets  itemSize:(CGSize)itemSize selector:(SEL)sel {
    return [self jz_setupItemWithImageName:nil title:title color:color font:font titleEdgeInsets:titleEdgeInsets imageEdgeInsets:UIEdgeInsetsZero selector:sel itemSize:itemSize direction:@"right"];
}

// --
//- (UIButton *)jz_setupRightItemWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets imageEdgeInsets:(UIEdgeInsets )imageEdgeInsets selector:(SEL)sel {
//    return [self jz_setupItemWithImageName:nil title:title color:color font:font titleEdgeInsets:titleEdgeInsets imageEdgeInsets:imageEdgeInsets selector:sel itemSize:CGSizeMake(60.f, 60.f) direction:@"right"];
//}

/**
 *   direction = 左右方向，“left” 为leftBarButtonItem， "right" 为rightBarButtonItem
 */
- (UIButton *)jz_setupItemWithImageName:(NSString *)imageName title:(NSString *)title color:(UIColor *)color font:(UIFont *)font titleEdgeInsets:(UIEdgeInsets )titleEdgeInsets imageEdgeInsets:(UIEdgeInsets )imageEdgeInsets selector:(SEL)sel itemSize:(CGSize)itemSize direction:(NSString *)direction{
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    itemBtn.frame = CGRectMake(0, 0, itemSize.width, itemSize.height);
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName];
        [itemBtn setImage:image forState:UIControlStateNormal];
        [itemBtn setImageEdgeInsets:imageEdgeInsets];
    }else if (title) {
        [itemBtn setTitle:title forState:UIControlStateNormal];
        [itemBtn setTitleColor:color forState:UIControlStateNormal];
        itemBtn.titleLabel.font = font;
        [itemBtn setTitleEdgeInsets:titleEdgeInsets];
    }
    if (sel) {
        [itemBtn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
    if ([direction isEqualToString:@"left"]) {
        self.navigationItem.leftBarButtonItem = item;
    }else if ([direction isEqualToString:@"right"]) {
        self.navigationItem.rightBarButtonItem = item;
    }
    return itemBtn;
}


#pragma mark - TitleView NavigationItem
- (void)jz_setupNavTitle:(NSString *)title {
    self.navigationItem.title = title;
}

// 当push的时候返回NO，当pop的时候返回YES
- (BOOL)jz_popViewController{
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

- (void)jz_dismissViewController {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
