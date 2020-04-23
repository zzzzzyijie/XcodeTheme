//
//  UIButton+JZAdd.h
//  JZDevHelperDemo
//
//  Created by Jie  on 2018/10/26.
//  Copyright © 2018年 www.noname.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JZAdd)

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *selectedTitle;
@property (nonatomic, copy) NSString *disabledTitle;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIImage *disabledImage;

@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImage *selectedBackgroundImage;
@property (nonatomic, strong) UIImage *disabledBackgroundImage;

@end
