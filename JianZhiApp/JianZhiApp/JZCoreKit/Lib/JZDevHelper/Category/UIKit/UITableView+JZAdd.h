/*******************************************************************************\
** JZAppDemo:UITableView+JZAdd.h
** Created by Zengyijie(jackiezeng01@163.com) on 2017/8/18
**
**  Copyright © 2017年 Jie . All rights reserved.
\*******************************************************************************/


#import <UIKit/UIKit.h>

@interface UITableView (JZAdd)
// 取消选择状态
- (void)jz_clearsSelection;

// 更新headerHeight
- (void)updateHeaderHeight:(CGFloat)height;

// 更新FooterHeight
- (void)updateFooterHeight:(CGFloat)height;

@end
