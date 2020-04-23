//
//  UIView+JZAdd.h
//  BaibuSeller
//
//  Created by Jie on 16/4/21.
//  Copyright © 2016年 whawhawhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JZAdd)

#pragma mark - Frame
@property (nonatomic,assign) CGFloat jz_x;
@property (nonatomic,assign) CGFloat jz_y;
@property (nonatomic,assign) CGFloat jz_centerX;
@property (nonatomic,assign) CGFloat jz_centerY;
@property (nonatomic,assign) CGFloat jz_width;
@property (nonatomic,assign) CGFloat jz_height;
@property (nonatomic,assign) CGSize jz_size;
@property (nonatomic,assign) CGPoint jz_origin;
@property (nonatomic,assign) CGFloat jz_top;
@property (nonatomic,assign) CGFloat jz_bottom;
@property (nonatomic,assign) CGFloat jz_left;
@property (nonatomic,assign) CGFloat jz_right;
@property (nullable,nonatomic, readonly) UIViewController *jz_currentViewController;

#pragma mark - Ohter
- (void)jz_hideKeyBoard;
- (void)jz_removeAllSubviews;
+ (instancetype _Nullable )jz_viewFromXib;
- (instancetype _Nullable)finish;


@end

#pragma mark - Image Snapshot

@interface UIView (Snapshot)
/**
 Create a snapshot image of the complete view hierarchy.
 */
- (nullable UIImage *)snapshotImage;
/**
 Create a snapshot image of the complete view hierarchy.
 @discussion It's faster than "snapshotImage", but may cause screen updates.
 See -[UIView drawViewHierarchyInRect:afterScreenUpdates:] for more information.
 */
- (nullable UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

@end


