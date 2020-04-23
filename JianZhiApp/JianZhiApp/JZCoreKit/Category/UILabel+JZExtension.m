//
//  UILabel+JZExtension.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "UILabel+JZExtension.h"

@implementation UILabel (JZExtension)

//@dynamic jz_TextColor;
- (void)setJz_TextColor:(UIColor *)jz_TextColor {
    self.textColor = jz_TextColor;
}

- (UIColor *)jz_TextColor {
    return self.textColor;
}

@end
