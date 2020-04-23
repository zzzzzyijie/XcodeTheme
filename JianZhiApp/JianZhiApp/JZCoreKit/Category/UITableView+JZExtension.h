//
//  UITableView+JZExtension.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/15.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (JZExtension)

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
- (void)jz_registerHeaderFooterNib:(NSString *)nibName;

/*
 *  className为Xcell class，同时也为reuseIdentifier
 */
- (void)jz_registerHeaderFooterClass:(Class )className;

/*
 *  给给一个section设置圆角的显示
 *  在tableView的willDisplayCell调用
 */
- (void)configCorner:(CGFloat)radius
             padding:(CGFloat)padding
           fillColor:(UIColor *)fillColor
           tableView:(UITableView *)tableView
                cell:(UITableViewCell *)cell
   forRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
