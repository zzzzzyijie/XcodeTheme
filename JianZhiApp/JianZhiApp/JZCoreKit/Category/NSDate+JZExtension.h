//
//  NSDate+JZExtension.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/14.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (JZExtension)
// 注意: 打印的Date类型会有时区差的显示，但转成字符串后则显示正确
#pragma mark = 当前时间
// 当前的时间 ( Date类型
+ (NSDate *)currentDate;
// 当前的时间 ( 时间戳类型 Since1970
+ (NSTimeInterval)currentTimeInterval;
// 当前的时间 ( 字符串类型
+ (NSString *)currentDateWithFormat:(NSString *)format;

#pragma mark - NSDate, NSString , 时间戳的转换
// 字符串时间 --> 转NSDate (如："2020/4/14 11:7:43" -> NSDate
+ (NSDate *)dateFromStringDate:(NSString *)stringDate format:(NSString *)format;
// 时间戳 --> NSDate (如：1586833663 -> NSDate
+ (NSDate *)dateFromTimeInterval:(NSTimeInterval)timeInterval;

// NSDate --> 字符串 (如：NSDate -> "2020/4/14 11:7:43" (取决具体format)
- (NSString *)stringFromDateWithformat:(NSString *)format;
// NSTimeInterval --> 字符串 (如：1586833663 -> "2020/4/14 11:7:43" (取决具体format)
+ (NSString *)stringFromTimeInterval:(NSTimeInterval )timeInterval format:(NSString *)format;

// Date --> NSTimeInterval  (如：NSDate -> 1586833663
- (NSTimeInterval)timeIntervalFromDate;
// 字符串时间 --> NSTimeInterval  (如："2020/4/14 11:7:43" -> 1586833663
+ (NSTimeInterval)timeIntervalFromString:(NSString *)stringDate;

@end

NS_ASSUME_NONNULL_END
