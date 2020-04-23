//
//  UITableViewCell+QuickInit.m
//  OnlineClass
//
//  Created by Jie on 2017/5/9.
//  Copyright © 2017年  Jie. All rights reserved.
//

#import "UITableViewCell+QuickInit.h"

@implementation UITableViewCell (QuickInit)

+ (instancetype)jz_cellWithTableView:(UITableView *)tableView{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[[self class] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    return cell;
}

+ (instancetype)jz_xibCellWithTabelView:(UITableView *)tableView{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    }
    return cell;
}

@end


