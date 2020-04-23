//
//  JZTabbarPropressView.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/22.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TabbarProgressView : UIView

@property (nonatomic,assign) CGFloat progress;

@end

@interface JZTabbarPropressView : UIView

@property (nonatomic,strong) TabbarProgressView *progressView;

@property (nonatomic,strong) UIButton *playButton;

@end

NS_ASSUME_NONNULL_END
