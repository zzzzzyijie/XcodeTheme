//
//  JZTabbar.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/21.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JZTabBarButtonState) {
    JZTabBarButtonStateNormal,
    JZTabBarButtonStateSelect
};

NS_ASSUME_NONNULL_BEGIN
// ------------------------------------------------------------------------------------------------------------
@interface JZTabbar : UITabBar

/** 当前选择的item index */
@property(nonatomic,assign) NSUInteger currentIndex;

/** defautSelectIndex （默认0 */
@property(nonatomic,assign) NSUInteger defautSelectIndex;

/** 暴露在外部，由外部控制Tabbar是否需要显示 */
- (void)tabbarItemDidSelect:(NSUInteger)index;

/** badgeValue(这个仅仅设置消息的badge */
//@property (nonatomic,copy) NSString *badgeValue;


/// 开始播放
- (void)playAudio;

/// 停止播放
- (void)stopAudio;

@end

// ------------------------------------------------------------------------------------------------------------

@interface JZTabBarButton : UIView

- (instancetype)initWithTabBarItem:(UITabBarItem *)item frame:(CGRect)frame;

/** badgeValue(这个仅仅设置消息的badge */
//@property (nonatomic,copy) NSString *badgeValue;

@property (nonatomic,assign) JZTabBarButtonState state;

@end

// ------------------------------------------------------------------------------------------------------------

@interface UITabBarItem (JZTabbar)

/** UITabBarItem 显示单张大图 */
@property (nonatomic,strong) UIImage *largeImage;

/** UITabBarItem 图片位移的位置 */
@property (nonatomic,assign) UIOffset imagePositionAdjustment;

/** UITabBarItem controller的index */
@property (nonatomic,assign) NSInteger indexForController;

@end

NS_ASSUME_NONNULL_END
