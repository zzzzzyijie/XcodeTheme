//
//  JZTabbar.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/21.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZTabbar.h"
// View
#import "JZTabbarPropressView.h"
// Model
#import <objc/runtime.h>

// ------------------------------------------------------------------------------------------------------------
@interface JZTabbar ()
@property (nonatomic,assign) BOOL isAddCustomTabbabButton;
@property (nonatomic,strong) NSMutableArray<JZTabBarButton *> *tabbabButtonArray;
/** 当前选择的item index */
//@property(nonatomic,assign) NSUInteger selectIndex;
@end

@implementation JZTabbar

#pragma mark - =============== JZTabbar ================
#pragma mark - =============== Life Cycle ================

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tabbabButtonArray = @[].mutableCopy;
        self.defautSelectIndex = 0;
        [self configTopLineColor:UIColor.whiteColor];
        self.translucent = NO; // 解决tabbar下移的问题
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 移除系统的UITabBarButton,添加自定义的JZTabBarButton
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [obj removeFromSuperview];
        }
    }];

    // 添加自定义的 JZTabBarButton ( 避免重复添加
    if (!self.isAddCustomTabbabButton) {
        if (self.items && self.items.count > 0) {
            [self createCustomButtonWithItems];
        }
    }
}

#pragma mark - =============== Private Method ================
// ------------------------------------------------------------------------------------------------------------
- (void)createCustomButtonWithItems {
    CGFloat selfW = CGRectGetWidth(self.bounds);
    CGFloat itemWidth = selfW / self.items.count;
    CGFloat itemHeight = 48.0f;
    [self.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect itemFrame = CGRectMake(idx * itemWidth, 1, itemWidth, itemHeight);
        JZTabBarButton *tabbarButton = [[JZTabBarButton alloc] initWithTabBarItem:obj frame:itemFrame];
        tabbarButton.tag = idx;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabbarButtonDidTap:)];
        [tabbarButton addGestureRecognizer:tap];
        [self addSubview:tabbarButton];
        [self.tabbabButtonArray addObject:tabbarButton];
    }];
    self.isAddCustomTabbabButton = YES;
    [self tabbarItemDidSelect:self.defautSelectIndex]; // 默认选中首页
}

// ------------------------------------------------------------------------------------------------------------
- (void)setBadgeValue:(NSString *)badgeValue {
//    _badgeValue = badgeValue;
//    JZTabBarButton *tabbarButton = [self.tabbabButtonArray objectAtIndexCheck:3];
//    if (tabbarButton) {
//        tabbarButton.badgeValue = badgeValue;
//    }
}

// ------------------------------------------------------------------------------------------------------------
- (void)configTopLineColor:(UIColor *)topLineColor {
    // 改变shadowImage
    UIImage *shadowImage;
    if (topLineColor) {
        shadowImage = [UIImage jz_imageWithColor:topLineColor size:CGSizeMake(1,0.5f)];
    }else {
        shadowImage = UIImage.new;
    }
    self.shadowImage = shadowImage;
    
    // 背景图片
//    UIColor *backgroundImageColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.75];
    UIColor *backgroundImageColor = Color_F5F8FA;
    self.backgroundImage = [UIImage jz_imageWithColor:backgroundImageColor size:CGSizeMake(UIScreen.mainScreen.bounds.size.width, 0.5f)];
    
    // 背景颜色
    self.backgroundColor = backgroundImageColor;
    
    // 毛玻璃效果 ( 会影响背景颜色值
    UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    visualEfView.alpha = 0.75;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat shadowImageHeigt = shadowImage.size.height;
    if (iPhoneXSeries) { // iPhoneX系列
        visualEfView.frame = CGRectMake(0, -(shadowImageHeigt), screenSize.width, 83+shadowImageHeigt);
    }else{
        visualEfView.frame = CGRectMake(0, -(shadowImageHeigt), screenSize.width, 49+shadowImageHeigt);
    }
    [self insertSubview:visualEfView atIndex:0];
}

// ------------------------------------------------------------------------------------------------------------

/// 开始播放
- (void)playAudio {
//    JZTabBarButton *tabbarButton = [self.tabbabButtonArray objectAtIndexCheck:3];
//    tabbarButton.state =
}

/// 停止播放
- (void)stopAudio {
    
}

#pragma mark - ============== Action ============
- (void)tabbarButtonDidTap:(UITapGestureRecognizer *)tapGesture {
    NSInteger index = tapGesture.view.tag;
    self.currentIndex = index;
    // 代理回调
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectItem:)]) {
        [self.delegate tabBar:self didSelectItem:self.items[index]];
    }else {
        UITabBarItem *currentItem = self.items[index];
        UITabBarController *tabbarVc = (UITabBarController*)[currentItem valueForKey:@"_target"];
        if (!tabbarVc) {
            tabbarVc = (UITabBarController*)[currentItem valueForKey:@"target"];
        }
        if (tabbarVc) {
            tabbarVc.selectedIndex = index;
            [self tabbarItemDidSelect:index];
        }
    }
}

- (void)tabbarItemDidSelect:(NSUInteger)index {
    if (!self.tabbabButtonArray || self.tabbabButtonArray.count <= 0) {
        return;
    }
    self.currentIndex = index;
    JZLog(@"index------- %zd",index);
    // 修改状态
    [self.tabbabButtonArray enumerateObjectsUsingBlock:^(JZTabBarButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == index) {
            obj.state = JZTabBarButtonStateSelect;
//            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//速度控制函数，控制动画运行的节奏
//            animation.duration = 0.25;       //执行时间
//            animation.repeatCount = 1;      //执行次数
//            animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
//            animation.fromValue = [NSNumber numberWithFloat:0.9];   //初始伸缩倍数
//            animation.toValue = [NSNumber numberWithFloat:1.1];     //结束伸缩倍数
//            [[obj layer] addAnimation:animation forKey:nil];
        }else {
            obj.state = JZTabBarButtonStateNormal;
        }
    }];
}

#pragma mark - ==================== Setter ==================
// 是否显示Tabbar顶部的分割线
- (void)setIsShowTopLine:(BOOL)isShowTopLine {
//    if (isShowTopLine) {
//        [self configTopLineColor:self.topLineColor];
//    }else {
//        [self configTopLineColor:nil];
//    }
}

// 是否显示阴影
- (void)setIsShowShadow:(BOOL)isShowShadow {
    if (isShowShadow) {
        UIColor *shadowColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.f];
        self.layer.shadowColor = shadowColor.CGColor;
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowRadius = 3;
    }else {
        self.layer.shadowColor = nil;
    }
}


#pragma mark - =============== JZTabBarButton ================

@end

// ------------------------------------------------------------------------------------------------------------

@interface JZTabBarButton ()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *badgeLabel;
@property (nonatomic,strong) JZTabbarPropressView *propressView;
@property (nonatomic,assign) NSInteger indexForController;
@property (nonatomic,strong) UITabBarItem *tabbarItem;
@property (nonatomic,assign) CGFloat badgeWH;

@end

@implementation JZTabBarButton

/**
    系统的 TabBarButton frame = (2 1; 134 48)
 */
- (instancetype)initWithTabBarItem:(UITabBarItem *)item frame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"--- JZTabBarButton --- index = %zd",item.indexForController);
        self.backgroundColor = UIColor.clearColor;
        self.tabbarItem = item;
        self.indexForController = item.indexForController;
        if (item.indexForController == 2) { // 播放
            [self addSubview:self.propressView];
        }else {
            [self addSubview:self.imageView];
            [self addSubview:self.titleLabel];
            [self addSubview:self.badgeLabel];
            self.titleLabel.text = self.tabbarItem.title;
        }
        self.state = JZTabBarButtonStateNormal;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat selfW = CGRectGetWidth(self.bounds);
    
    UIOffset imageOffset = self.tabbarItem.imagePositionAdjustment;
    CGFloat imageWidth = 27.f;  //28.f;
    CGFloat imageHeight = 24.f; //28.f;
    CGFloat imageX = (selfW-imageWidth)/2+imageOffset.horizontal;
    CGFloat imageY = 5.5+imageOffset.vertical;
    self.imageView.frame  = CGRectMake(imageX, imageY, imageWidth, imageHeight);
    
    UIOffset titlePosition = self.tabbarItem.titlePositionAdjustment;
    [self.titleLabel sizeToFit];
    CGFloat titleW = CGRectGetWidth(self.titleLabel.bounds);
    CGFloat titleH = CGRectGetHeight(self.titleLabel.bounds);
    CGFloat titleX = (selfW-titleW)/2 + titlePosition.horizontal;
    CGFloat titleY = 33.f+titlePosition.vertical;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);

    
    if (self.indexForController == 2 && _propressView) {
        CGFloat progressWidth = _propressView.jz_width;
        CGFloat progressX = (selfW-progressWidth)/2;
        CGFloat progressY = 4;
        self.propressView.jz_x = progressX;
        self.propressView.jz_y = progressY;
    }
    
    //[self updateBadgeLayout];
}

- (void)updateBadgeLayout {
    self.badgeLabel.frame = CGRectMake(self.imageView.jz_right - (self.badgeWH/2), 2,self.badgeWH,18.0f);
}

#pragma mark - ==================== Setter ==================
- (void)setState:(JZTabBarButtonState)state {
    UITabBarItem *itemAppearacne;
    UITabBarController *tabbarVc = (UITabBarController*)[self.tabbarItem valueForKey:@"_target"];
    if (tabbarVc){
        itemAppearacne = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[tabbarVc.class]];
    }else {
        itemAppearacne = [UITabBarItem appearance];
    }
    //JZTabbar *tabbar = (JZTabbar *)self.superview;
    //NSInteger currentIndex = tabbar.selectIndex;
    if (state == JZTabBarButtonStateNormal) {
        if (self.indexForController == 2) { // 播放
            self.imageView.hidden = YES;
            self.titleLabel.hidden = YES;
            self.propressView.hidden = NO;
        }else {
            self.propressView.hidden = YES;
            self.imageView.hidden = NO;
            self.titleLabel.hidden = NO;
            self.imageView.image = self.tabbarItem.image;
            NSDictionary<NSAttributedStringKey,id> *normalAttr = [itemAppearacne titleTextAttributesForState:UIControlStateNormal];
            if (normalAttr[NSForegroundColorAttributeName]) {
                self.titleLabel.textColor = (UIColor *)normalAttr[NSForegroundColorAttributeName];
            }
            if (normalAttr[NSFontAttributeName]) {
                self.titleLabel.font = normalAttr[NSFontAttributeName];
            }
        }
    }else if (state == JZTabBarButtonStateSelect) {
        if (self.indexForController == 2) { // 播放
            self.imageView.hidden = YES;
            self.titleLabel.hidden = YES;
            self.propressView.hidden = NO;
        }else {
            self.propressView.hidden = YES;
            self.imageView.hidden = NO;
            self.titleLabel.hidden = NO;
            self.imageView.image = self.tabbarItem.selectedImage;
            NSDictionary<NSAttributedStringKey,id> *selectAttr = [itemAppearacne titleTextAttributesForState:UIControlStateSelected];
            if (selectAttr[NSForegroundColorAttributeName]) {
                self.titleLabel.textColor = (UIColor *)selectAttr[NSForegroundColorAttributeName];
            }
            if (selectAttr[NSFontAttributeName]) {
                self.titleLabel.font = selectAttr[NSFontAttributeName];
            }
        }
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setBadgeValue:(NSString *)badgeValue {
//    NSInteger badgeInt = badgeValue.integerValue;
//    if (badgeInt > 0) {
//        self.badgeLabel.hidden = NO;
//        self.badgeLabel.text = badgeValue;
//        if (badgeInt >= 10) {
//            self.badgeWH = 25.f;
//        }else {
//            self.badgeWH = 18.f;
//        }
//        if (badgeInt >= 100) {
//            self.badgeLabel.text = @"99+";
//        }
//        [self updateBadgeLayout];
//    }else {
//        self.badgeLabel.hidden = YES;
//        self.badgeWH = 18.f;
//    }
}


#pragma mark - ==================== Getter ==================
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12]; // 默认12
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (JZTabbarPropressView *)propressView {
    if (!_propressView) {
        CGSize size;
        if (iPhoneXSeries) {
            size = CGSizeMake(45, 45);
        }else {
            size = CGSizeMake(40, 40);
        }
        _propressView = [[JZTabbarPropressView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        _propressView.hidden = YES;
    }
    return _propressView;
}

- (UILabel *)badgeLabel {
    if (!_badgeLabel) {
//        UILabel *label = [DDUIHelper generalLabel];
//        //label.text = @"2";
//        label.layer.cornerRadius = 18.f/2;
//        label.layer.masksToBounds = YES;
//        label.layer.borderColor = UIColor.redColor.CGColor;
//        label.layer.borderWidth = 0.5;
//        label.font = [UIFont systemFontOfSize:12];
//        label.textAlignment = NSTextAlignmentCenter;
//        label.textColor = UIColor.redColor;
//        label.backgroundColor = JZColorWhite;
//        label.hidden = YES;
//        _badgeLabel = label;
    }
    return _badgeLabel;
}

@end

// ------------------------------------------------------------------------------------------------------------

#pragma mark - =============== UITabBarItem (JZTabbar) ================
static const void *UITabBarItemlargeImageKey = &UITabBarItemlargeImageKey;
static const void *UITabBarItemimagePositionAdjustmentKey = &UITabBarItemimagePositionAdjustmentKey;
static const void *UITabBarItemIndexForControllerKey = &UITabBarItemIndexForControllerKey;
@implementation UITabBarItem (JZTabbar)

- (void)setLargeImage:(UIImage *)largeImage {
    if (largeImage) {
        objc_setAssociatedObject(self, UITabBarItemlargeImageKey, largeImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (UIImage *)largeImage {
    return objc_getAssociatedObject(self, UITabBarItemlargeImageKey);
}

- (void)setImagePositionAdjustment:(UIOffset)imagePositionAdjustment {
    if (imagePositionAdjustment.horizontal > 0 ||  imagePositionAdjustment.vertical > 0) {
        objc_setAssociatedObject(self, UITabBarItemimagePositionAdjustmentKey, [NSNumber valueWithUIOffset:imagePositionAdjustment], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (UIOffset)imagePositionAdjustment {
    NSNumber *imageOffset = objc_getAssociatedObject(self, UITabBarItemimagePositionAdjustmentKey);
    if (imageOffset) {
        return imageOffset.UIOffsetValue;
    }
    return UIOffsetZero;
}

- (void)setIndexForController:(NSInteger )indexForController {
//    NSNumber *index = objc_getAssociatedObject(self, UITabBarItemIndexForControllerKey);
    objc_setAssociatedObject(self, UITabBarItemIndexForControllerKey, [NSNumber numberWithInteger:indexForController], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)indexForController {
    NSNumber *index = objc_getAssociatedObject(self, UITabBarItemIndexForControllerKey);
    if (index) {
        return index.integerValue;
    }
    return 0;
}

@end
