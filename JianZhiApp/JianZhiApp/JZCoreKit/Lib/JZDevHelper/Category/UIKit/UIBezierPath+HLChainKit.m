//
//  UIBezierPath+HLChainKit.m
//  HLChainKit
//
//  Created by kisekied on 25/09/2017.
//  Copyright © kisekied.
//

#import "UIBezierPath+HLChainKit.h"

@implementation UIBezierPath (HLChainKit)

- (UIBezierPath *(^)(CGPoint point))moveTo {
    return ^UIBezierPath* (CGPoint point) {
        [self moveToPoint:point];
        return self;
    };
}

- (UIBezierPath *(^)(CGPoint point))lineTo {
    return ^UIBezierPath* (CGPoint point) {
        [self addLineToPoint:point];
        return self;
    };
}

- (UIBezierPath *(^)(CGPoint, CGPoint, CGPoint))curveTo {
    return ^UIBezierPath* (CGPoint endPoint, CGPoint controlPoint1, CGPoint controlPoint2) {
        [self addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        return self;
    };
}

- (UIBezierPath *(^)(CGPoint, CGPoint))quadCurveTo {
    return ^UIBezierPath* (CGPoint endPoint, CGPoint controlPoint) {
        [self addQuadCurveToPoint:endPoint controlPoint:controlPoint];
        return self;
    };
}

- (UIBezierPath *(^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL))arc {
    return ^UIBezierPath* (CGPoint center, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise) {
        [self addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
        return self;
    };
}

- (UIBezierPath *(^)(void))close {
    return ^UIBezierPath* (void) {
        [self closePath];
        return self;
    };
}

- (UIBezierPath *(^)(UIBezierPath *))append {
    return ^UIBezierPath* (UIBezierPath *path) {
        [self appendPath:path];
        return self;
    };
}

@end
