//
//  JZUIHelper.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JZUIButton;
NS_ASSUME_NONNULL_BEGIN

@interface JZCollectionConfig : NSObject
/** 滚动方向  */
@property (nonatomic) UICollectionViewScrollDirection scrollDirection; // default is UICollectionViewScrollDirectionVertical
// ---- Verticals -----
/** 主要需要确定宽度，用于计算itemW 默认整个屏幕（ Direction=Verticals 需要设置 */
@property (nonatomic,assign) CGFloat contentWidth;
/** rowCount （ 每一行显示多小个  = 默认1  （ Direction=Verticals 有效 */
@property (nonatomic,assign) CGFloat rowCount;
/** itemHeight（ item高度，如果不设置，默认=itemWidth（ Direction=Verticals 有效 */
@property (nonatomic,assign) CGFloat itemHeight;

// ---- Horizontal ----
/** 主要需要确定宽度，用于计算itemH ( Direction=Horizontal 需要设置 */
@property (nonatomic,assign) CGFloat contentHeight;
/** rowCount （ 每一列显示多小个  = 默认1 ( Direction=Horizontal 有效 */
@property (nonatomic,assign) CGFloat columCount;
/** itemWidth（ item宽度，如果不设置，默认=itemWidth（ Direction=Horizontal 有效 */
@property (nonatomic,assign) CGFloat itemWidth;

// ---- public ----
/** insetForSection ( sction间的间距 = 默认zero */
@property (nonatomic,assign) UIEdgeInsets insetForSection;
/** minimumInteritemSpacing ( cell之间的间距 = 默认0 */
@property (nonatomic,assign) CGFloat minimumInteritemSpacing;
/** minimumLineSpacing （ 上下 行的间距 = 默认0  */
@property (nonatomic,assign) CGFloat minimumLineSpacing;

@end

@interface JZUIHelper : NSObject

// Line View
+ (UIView *)createLineView;


// JZUIButton
+ (JZUIButton *)generalButton;
+ (JZUIButton *)sameStyleWithButton:(JZUIButton *)otherButton;


// UILabel
+ (YYLabel *)createLabel;
+ (YYLabel *)sameStyleWithLabel:(UILabel *)otherLabel;


// UIImageView
+ (UIImageView *)createImageView;


// UITabelView
+ (UITableView *)createTableViewWithStyle:(UITableViewStyle)type;


// UIScrollView
+ (UIScrollView *)createScrollView;


// UICollectionView
+ (UICollectionView *)createFlowLayoutCollectionViewWithConfig:(JZCollectionConfig*)config;
+ (UICollectionView *)createCollectionViewWithLaout:(UICollectionViewLayout*)layout;

@end

NS_ASSUME_NONNULL_END
