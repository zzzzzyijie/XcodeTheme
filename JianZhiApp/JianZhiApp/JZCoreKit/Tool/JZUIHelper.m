//
//  JZUIHelper.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZUIHelper.h"
#import "JZUIButton.h"

@implementation JZCollectionConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.contentWidth = UIScreen.mainScreen.bounds.size.width; // 默认整个屏幕
        self.insetForSection = UIEdgeInsetsZero;
        self.minimumInteritemSpacing = 0.f;
        self.minimumLineSpacing = 0.f;
        self.rowCount = 1;
        self.columCount = 1;
    }
    return self;
}

@end

@implementation JZUIHelper

// Line View
+ (UIView *)createLineView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.5f)];
    //view.backgroundColor = AppLineColor; // line color
    return view;
}

// JZUIButton
+ (JZUIButton *)generalButton {
    JZUIButton *button = [[JZUIButton alloc] init];
    //[button setTitleColor:AppNormalTextColor forState:UIControlStateNormal];
    //button.titleLabel.font = FONT_14; // default font
    button.imagePosition = JZUIButtonImagePositionLeft;
    button.adjustsButtonWhenHighlighted = YES;
    return button;
}

+ (JZUIButton *)sameStyleWithButton:(JZUIButton *)otherButton {
    JZUIButton *button = [[JZUIButton alloc] init];
    button.imagePosition = otherButton.imagePosition;
    button.adjustsButtonWhenHighlighted = otherButton.adjustsButtonWhenHighlighted;
    button.adjustsImageWhenHighlighted = otherButton.adjustsImageWhenHighlighted;
    button.titleLabel.font = otherButton.titleLabel.font;
    [button setTitleColor:[otherButton titleColorForState:UIControlStateNormal] forState:UIControlStateNormal];
    button.layer.borderColor = otherButton.layer.borderColor;
    button.layer.borderWidth = otherButton.layer.borderWidth;
    button.layer.cornerRadius = otherButton.layer.cornerRadius;
    button.layer.masksToBounds = otherButton.layer.masksToBounds;
    return button;
}

// UILabel
+ (YYLabel *)createLabel {
    YYLabel *label = [[YYLabel alloc] initWithFrame:CGRectZero];
    //label.textColor = AppNormalTextColor;
    //label.font = FONT_14;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 1;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    return label;
}

+ (YYLabel *)sameStyleWithLabel:(YYLabel *)otherLabel {
    YYLabel *label = [[YYLabel alloc] initWithFrame:CGRectZero];
    label.textColor = otherLabel.textColor;
    label.font = otherLabel.font;
    label.textAlignment = otherLabel.textAlignment;
    label.numberOfLines = otherLabel.numberOfLines;
    label.lineBreakMode = otherLabel.lineBreakMode;
    label.layer.borderColor = otherLabel.layer.borderColor;
    label.layer.borderWidth = otherLabel.layer.borderWidth;
    label.layer.cornerRadius = otherLabel.layer.cornerRadius;
    label.layer.masksToBounds = otherLabel.layer.masksToBounds;
    return label;
}

// UIImageView
+ (UIImageView *)createImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    //imageView.backgroundColor = UIColor.whiteColor;
    //imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

// UITabelView
+ (UITableView *)createTableViewWithStyle:(UITableViewStyle)type {
    UITableView *contentTableView = [[UITableView alloc] initWithFrame:CGRectZero style:type];
    contentTableView.showsVerticalScrollIndicator = NO;
    contentTableView.showsHorizontalScrollIndicator = NO;
    contentTableView.alwaysBounceVertical = YES;
    contentTableView.backgroundColor = UIColor.whiteColor;
    if (@available(iOS 11.0, *)) { // 可看情况
        contentTableView.estimatedRowHeight = 0.f;
        contentTableView.estimatedSectionFooterHeight = 0.f;
        contentTableView.estimatedSectionHeaderHeight = 0.f;
    }
    contentTableView.tableFooterView = [UIView new];
    return contentTableView;
}

// UIScrollView
+ (UIScrollView *)createScrollView {
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    contentScrollView.showsVerticalScrollIndicator = NO;
    contentScrollView.showsHorizontalScrollIndicator = NO;
    contentScrollView.alwaysBounceVertical = YES;
    contentScrollView.alwaysBounceHorizontal = NO;
    //contentScrollView.scrollEnabled = NO;
    //contentScrollView.pagingEnabled = NO;
    //contentScrollView.canCancelContentTouches = YES;
    contentScrollView.backgroundColor = UIColor.whiteColor;
    return contentScrollView;
}

// UICollectionView
+ (UICollectionView *)createFlowLayoutCollectionViewWithConfig:(JZCollectionConfig*)config {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = config.scrollDirection;
    layout.sectionInset = config.insetForSection;
    layout.minimumLineSpacing = config.minimumLineSpacing;
    layout.minimumInteritemSpacing = config.minimumInteritemSpacing;
    if (config.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        NSAssert(config.contentHeight > 0, @"config.contentHeight must not be 0.");
        CGFloat lineSpaceW = (config.columCount - 1) * config.minimumInteritemSpacing;
        CGFloat itemH = (config.contentHeight - (config.insetForSection.top + config.insetForSection.bottom)-lineSpaceW)/config.columCount;
        itemH = floor(itemH);
        layout.itemSize = CGSizeMake(config.itemWidth>0?config.itemWidth:itemH, itemH);
    }else {
        NSAssert(config.contentWidth > 0, @"config.contentWidth must not be 0.");
        CGFloat lineSpaceW = (config.rowCount - 1) * config.minimumInteritemSpacing;
        CGFloat itemW = (config.contentWidth - (config.insetForSection.left + config.insetForSection.right)-lineSpaceW)/config.rowCount;
        itemW = floor(itemW);
        layout.itemSize = CGSizeMake(itemW, config.itemHeight>0?config.itemHeight:itemW);
    }
    return [self createCollectionViewWithLaout:layout];
}

+ (UICollectionView *)createCollectionViewWithLaout:(UICollectionViewLayout*)layout {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = UIColor.whiteColor;
    collectionView.allowsSelection = YES;
    collectionView.delaysContentTouches = NO;
    collectionView.alwaysBounceVertical = YES;
    collectionView.showsVerticalScrollIndicator = YES;
    collectionView.showsHorizontalScrollIndicator = YES;
    return collectionView;
}

@end
