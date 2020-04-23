//
//  UIBezierPath+HLChainKit.h
//  HLChainKit
//
//  Created by kisekied on 25/09/2017.
//  Copyright © kisekied.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (HLChainKit)

@property (readonly, nonatomic, copy) UIBezierPath* (^moveTo)(CGPoint point);
@property (readonly, nonatomic, copy) UIBezierPath* (^lineTo)(CGPoint point);
@property (readonly, nonatomic, copy) UIBezierPath* (^curveTo)(CGPoint endPoint, CGPoint controlPoint1, CGPoint controlPoint2);
@property (readonly, nonatomic, copy) UIBezierPath* (^quadCurveTo)(CGPoint endPoint, CGPoint controlPoint);
@property (readonly, nonatomic, copy) UIBezierPath* (^arc)(CGPoint center, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise);
@property (readonly, nonatomic, copy) UIBezierPath* (^close)(void);

@property (readonly, nonatomic, copy) UIBezierPath* (^append)(UIBezierPath *path);

@end
