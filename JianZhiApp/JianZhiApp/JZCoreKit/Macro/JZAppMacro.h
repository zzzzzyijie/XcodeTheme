//
//  DDCollectAppMacro.h
//  DDCollectApp
//
//  Created by Jie on 2019/5/9.
//  Copyright © 2019 ddybw. All rights reserved.
//

#ifndef JZAppMacro_h
#define JZAppMacro_h

// 引用：JZFontTool、EmptyTool、UIColor

#pragma mark ===========================  业务宏  ===============================
// ## App Key & Scheme ###

// ------------- # App 颜色 相关 -------------
// -----主色----
// 填充色
#define Color_29CCCC [UIColor jz_colorWithHexString:@"#29CCCC"]
#define AppMainColor Color_29CCCC
// 特殊配色、大标题、特殊标题
#define Color_404856 [UIColor jz_colorWithHexString:@"#404856"]
#define AppMainTextColor Color_404856

// -----辅色----
// 正文字体、主标题
#define Color_243030 [UIColor jz_colorWithHexString:@"#243030"]
// tab文字、正文、其他常规文字
#define Color_5E6262 [UIColor jz_colorWithHexString:@"#5E6262"]
// 常规文字
#define Color_8A8E8E [UIColor jz_colorWithHexString:@"#8A8E8E"]
// 辅助、次要文字
#define Color_B2B6B6 [UIColor jz_colorWithHexString:@"#B2B6B6"]
// 不可点击文字
#define Color_DEE0E0 [UIColor jz_colorWithHexString:@"#DEE0E0"]
// 分割线
#define Color_EDEDED [UIColor jz_colorWithHexString:@"#EDEDED"]
// 背景色
#define Color_F5F8FA [UIColor jz_colorWithHexString:@"#F5F8FA"]
// 特殊按钮颜色
#define Color_E4FAFA [UIColor jz_colorWithHexString:@"#E4FAFA"]
// 特殊标签配色
#define Color_FFF0EB [UIColor jz_colorWithHexString:@"#FFF0EB"]

// -----特殊字体配色----
// 价格
#define Color_FF5233 [UIColor jz_colorWithHexString:@"#FF5233"]
// 提示文字
#define Color_00C8C8 [UIColor jz_colorWithHexString:@"#00C8C8"]
// VIP
#define Color_B46E00 [UIColor jz_colorWithHexString:@"#B46E00"]

// -----特殊背景配色【播放页背景】----
#define Color_736978 [UIColor jz_colorWithHexString:@"#736978"]
#define Color_968C8C [UIColor jz_colorWithHexString:@"#968C8C"]
#define Color_828C82 [UIColor jz_colorWithHexString:@"#828C82"]
#define Color_A07D7D [UIColor jz_colorWithHexString:@"#A07D7D"]
#define Color_8291A0 [UIColor jz_colorWithHexString:@"#8291A0"]

// ----按钮配色【渐变】----
#define Color_0BCECE [UIColor jz_colorWithHexString:@"#0BCECE"]
#define Color_2DDCDC [UIColor jz_colorWithHexString:@"#2DDCDC"]
//--
#define Color_FADCAA [UIColor jz_colorWithHexString:@"#FADCAA"]
#define Color_E1AF55 [UIColor jz_colorWithHexString:@"#E1AF55"]



// 系统版本
#define kiOS10Later @available(iOS 10.0, *)
#define kiOS11Later @available(iOS 11.0, *)
#define kiOS12Later @available(iOS 12.0, *)
#define kiOS13Later @available(iOS 13.0, *)

// # 占位图片
#define AppPlaceholderImage [UIImage imageNamed:@"jiazaitu_datu"]
#define AppLogoImage [UIImage imageNamed:@"mine_logo"] // 头像

// # 字体 相关
// 绝对值设置字体
#define RegularFont(size) [UIFont jz_regularFontWithSize:(size)]
#define BoldFont(size) [UIFont jz_boldFontWithSize:(size)]
// 根据屏幕适配的设置字体
#define AdapterFont(size) [UIFont adapterRegularFontWithSize:(size)]
#define AdapterBoldFont(size) [UIFont adapterBoldFontWithSize:(size)]

// 屏幕尺寸
#define JZScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define JZScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define iPhone4Inch (JZScreenWidth == 320.0f && JZScreenHeight == 568.0f) // 5,5c,5s
#define iPhone47Inch (JZScreenWidth == 375.0f && JZScreenHeight == 667.0f) // 6,6s,7,8
#define iPhone55Inch (JZScreenWidth == 414.0f && JZScreenHeight == 736.0f) // 6p,6sp,7p,8p
#define iPhone58Inch (JZScreenWidth == 375.f && JZScreenHeight == 812.f) // x,xs
#define iPhoneXrMax (JZScreenWidth == 416.f && JZScreenHeight == 896.0f) // xr, Xsmax
#define iPhoneXSeries (JZScreenHeight == 896.0f || JZScreenHeight == 812.f) // X刘海系列

// View's Height
#define JZTabbar_Height       (49.0)
#define JZNavBar_Height       (44.0)
#define JZStatusBar_SafeHeight    (iPhoneXSeries ? (44.0):(20.0))
#define JZTabbar_SafeHeight       (iPhoneXSeries ? (49.0 + 34.0):(49.0))
#define JZBottom_SafeHeight   (iPhoneXSeries ? (34.0):(0))

// # 设置宽度、比例 （ 已设计稿为 375 * 667 )
#define AdapterSacle (UIScreen.mainScreen.bounds.size.width / 375.0f)
#define UI(x) UIAdapter(x) // Adapter
#define AdapterRect(x,y,width,height) UIRectAdapter(x,y,width,height)
#define JZBottomSafeHeight(height) (height+JZBottom_SafeHeight) // 设置-包括iPhoneX底部safeArea的高度

// 通知中心 、路由
#define JZNotificationCenter [NSNotificationCenter defaultCenter]
#define JZRouter [CTMediator sharedInstance] // 路由实例

// #Empty Chect
//#define DDIsEmpty(data) [EmptyTool jz_isEmpty:data]

// # Log 相关
#define JZDEBUG (DEBUG || AppTest || ReleaseBeta)
#if JZDEBUG
#define JZLog(FORMAT, ...) do { fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]); } while (0);
#else
#define JZLog(FORMAT, ...) nil;
#endif
// Log a rect/size/point
#define JZLogRect(rect) JZLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define JZLogSize(size) JZLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define JZLogPoint(point) JZLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)


// 忽略警告 -> 使用： BeginIgnoreClangWarning(警告名称) ，后面 EndIgnoreClangWarning
#define ArgumentToString(macro) #macro
#define ClangWarningConcat(warning_name) ArgumentToString(clang diagnostic ignored warning_name)
#define BeginIgnoreClangWarning(warningName) _Pragma("clang diagnostic push") _Pragma(ClangWarningConcat(#warningName))
#define EndIgnoreClangWarning _Pragma("clang diagnostic pop")


#endif /* DDCollectAppMacro_h */
