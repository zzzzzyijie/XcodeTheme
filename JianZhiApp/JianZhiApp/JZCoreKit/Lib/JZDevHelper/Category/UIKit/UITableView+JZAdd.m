/*******************************************************************************\
** JZAppDemo:UITableView+JZAdd.m
** Created by Zengyijie(jackiezeng01@163.com) on 2017/8/18
**
**  Copyright © 2017年 Jie . All rights reserved.
\*******************************************************************************/


#import "UITableView+JZAdd.h"

@implementation UITableView (JZAdd)

- (void)jz_clearsSelection{
    NSArray *selectedIndexPaths = [self indexPathsForSelectedRows];
    for (NSIndexPath *indexPath in selectedIndexPaths) {
        [self deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)updateHeaderHeight:(CGFloat)height {
    UIView *headerView = self.tableHeaderView;
    CGRect frame = headerView.frame;
    frame.size.height = height;
    headerView.frame = frame;
    [self beginUpdates];
    self.tableHeaderView = headerView;
    [self endUpdates];
}

- (void)updateFooterHeight:(CGFloat)height {
    UIView *footerView = self.tableFooterView;
    CGRect frame = footerView.frame;
    frame.size.height = height;
    footerView.frame = frame;
    [self beginUpdates];
    self.tableHeaderView = footerView;
    [self endUpdates];
}

@end
