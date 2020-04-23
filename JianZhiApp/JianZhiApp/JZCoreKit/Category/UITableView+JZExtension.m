//
//  UITableView+JZExtension.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/15.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "UITableView+JZExtension.h"

@implementation UITableView (JZExtension)

#pragma mark - Cell

- (void)jz_registerNib:(NSString *)nibName {
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:nibName];
}

- (void)jz_registerClass:(Class )className {
    [self registerClass:className forCellReuseIdentifier:NSStringFromClass(className)];
}

#pragma mark - Header & Footer

- (void)jz_registerHeaderFooterNib:(NSString *)nibName {
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forHeaderFooterViewReuseIdentifier:nibName];
}

- (void)jz_registerHeaderFooterClass:(Class )className {
    [self registerClass:className forHeaderFooterViewReuseIdentifier:NSStringFromClass(className)];
}


- (void)configCorner:(CGFloat)radius
             padding:(CGFloat)padding
           fillColor:(UIColor *)fillColor
           tableView:(UITableView *)tableView
                cell:(UITableViewCell *)cell
   forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize cornerRadius = CGSizeMake(radius, radius);
    cell.backgroundColor = UIColor.clearColor;
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CGRect bounds = CGRectInset(cell.bounds, padding, 0);
    
    UIBezierPath *path;
    if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
       path = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:cornerRadius];
    } else if (indexPath.row == 0) {
        path = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:cornerRadius];
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
        path = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:cornerRadius];
    }else {
        path = [UIBezierPath bezierPathWithRect:bounds];
    }
    layer.path = path.CGPath;
    layer.fillColor = fillColor.CGColor;
    UIView *testView = [[UIView alloc] initWithFrame:bounds];
    [testView.layer insertSublayer:layer atIndex:0];
    testView.backgroundColor = UIColor.whiteColor;
    cell.backgroundView = testView;
}


@end
