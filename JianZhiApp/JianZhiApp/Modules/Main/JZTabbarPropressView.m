//
//  JZTabbarPropressView.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/22.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZTabbarPropressView.h"

@interface JZTabbarPropressView()

@end

@implementation JZTabbarPropressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        UIButton *button = [[UIButton alloc] initWithFrame:self.bounds];
        [button setBackgroundImage:[UIImage jz_imageWithColor:UIColor.clearColor size:frame.size]];
        button.layer.borderColor = JZRGBAColor(94, 98, 98, 0.1).CGColor;
        button.layer.borderWidth = 3;
        button.layer.cornerRadius = frame.size.height*0.5;
        [button setImage:[UIImage imageNamed:@"tabbar_pause"]];
        [button setAdjustsImageWhenHighlighted:NO];
        self.playButton = button;
        [self addSubview:button];
        
        TabbarProgressView *progressView = [[TabbarProgressView alloc] initWithFrame:self.bounds];
        self.progressView = progressView;
        [self addSubview: progressView];
    }
    return self;
}

@end


@implementation TabbarProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}


- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    // setNeedsDisplay 在主线程下执行
    dispatch_async(dispatch_get_main_queue(), ^{
        self.hidden = NO;
        if (progress >= 1) {
            self->_progress = 0.01;
        }
        [self setNeedsDisplay];
    });
}

- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    CGFloat centerX = w * 0.5;
    CGFloat centerY = h * 0.5;
    // 进度条、圆
    CGContextSetRGBStrokeColor(ctx, 0.15, 0.8, 0.8, 1);
    CGContextSetLineWidth(ctx, 3.0);
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGFloat endAngle = - M_PI * 0.5 + self.progress * M_PI * 2  + 0.03; // 初始值0.05
    CGContextAddArc(ctx, centerX, centerY, w*0.5 - 1.5, - M_PI * 0.5, endAngle, 0); //添加一个圆
    CGContextDrawPath(ctx, kCGPathStroke); //绘制路径
}

@end
