//
//  UICollectionView+JZExtension.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/15.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "UICollectionView+JZExtension.h"

@implementation UICollectionView (JZExtension)

#pragma mark - Cell
- (void)jz_registerNib:(NSString *)nibName {
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:nibName];
}

- (void)jz_registerClass:(Class )className {
    [self registerClass:className forCellWithReuseIdentifier:NSStringFromClass(className)];
}

#pragma mark - Header & Footer

- (void)jz_registerHeaderFooterNib:(NSString *)nibName kind:(JZRegisterKind)kind {
    NSString *kindString;
    if (kind == Header) {
        kindString = UICollectionElementKindSectionHeader;
    }else if (kind == Footer) {
        kindString = UICollectionElementKindSectionFooter;
    }
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forSupplementaryViewOfKind:kindString withReuseIdentifier:nibName];
}

- (void)jz_registerHeaderFooterClass:(Class )className kind:(JZRegisterKind)kind {
    NSString *kindString;
    if (kind == Header) {
        kindString = UICollectionElementKindSectionHeader;
    }else if (kind == Footer) {
        kindString = UICollectionElementKindSectionFooter;
    }
    [self registerClass:className forSupplementaryViewOfKind:kindString withReuseIdentifier:NSStringFromClass(className)];
}


@end
