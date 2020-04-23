//
//  JZCyclePagerView.h
//  TYCyclePagerViewDemo
//
//  Created by Jie on 2020/4/14.
//  Copyright © 2020 tany. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    left,
    center,
    right,
} PageControlPositon;

@interface JZCyclePagerView : UIView

- (instancetype)initWithImageUrls:(NSArray<NSString *> *)imageUrls;

/** pageControl的位置 (默认居中 */
@property (nonatomic,assign) PageControlPositon controlPositon;

/** 是否无限滚动 ( 默认YES */
@property (nonatomic, assign) BOOL isInfiniteLoop;

/** urls */
@property (nonatomic,copy) NSArray<NSString *> *imageUrls;

@end

@interface JZCycleCollectionCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *contentImageView;

@end

NS_ASSUME_NONNULL_END
