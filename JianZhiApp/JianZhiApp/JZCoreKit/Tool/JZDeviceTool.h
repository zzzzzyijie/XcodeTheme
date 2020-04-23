//
//  JZDeviceTool.h
//  JZDevHelperDemo
//
//  Created by noone on 2018/11/15.
//  noone
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JZDeviceTool : NSObject

#pragma mark - 尺寸
/**
 *  iPhone X系列（包括X/XS/XR/MAX）
 */
+ (BOOL)isiPhoneX;

/**
 *  加上导航栏整个顶部的高度 statusBar + navBar
 */
+ (CGFloat)insetSafeTop;

/**
 *  底部的高度 bottomSafe ( 不包括tabbar 49
 */
+ (CGFloat)insetSafeBottom;

/**
 *  以 375 * 667 为基准的宽高比计算 比例宽度
 */
+ (CGFloat)adjustScaleWidth:(CGFloat)width;

/**
 * 以 375 * 667 为基准的宽高比计算 比例高度
 */
+ (CGFloat)adjustScaleHeight:(CGFloat)height;

/**
 *  计算比例
 */
+ (CGFloat)scaleWidthBy6s;
+ (CGFloat)scaleHeightBy6s;

#pragma mark - 系统信息

/**
 *  系统版本
 */
+ (double)currentiOSVersion;

/**
 *  UUID
 */
+ (NSString *)UUID;


#pragma mark - App 版本信息
/**
 *  App名称
 */
+ (NSString *)appBundleName;

/**
 *  App BundleId
 */
+ (NSString *)appBundleIdentifier;

/**
 *  App 版本
 */
+ (NSString *)appVersion;

/**
 *  App Build 版本
 */
+ (NSString *)appBuildVersion;


/**
 *  当前手机的型号
 */
+ (NSString *)currentDeviceModel;


@end
