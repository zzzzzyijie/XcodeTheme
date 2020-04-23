//
//  NSDate+JZExtension.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/14.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "NSDate+JZExtension.h"

@implementation NSDate (JZExtension)

#pragma mark - 当前时间
// 当前的时间 ( Date类型
+ (NSDate *)currentDate {
    return [NSDate date];
}

// 当前的时间 ( 时间戳类型
+ (NSTimeInterval)currentTimeInterval {
    return [[NSDate date] timeIntervalSince1970];
}

// 当前的时间 ( 字符串类型
+ (NSString *)currentDateWithFormat:(NSString *)format {
    NSDateFormatter *formatter = App.formatter;
    formatter.dateFormat = format;
    return [formatter stringFromDate:[self currentDate]];
}

#pragma mark - NSDate, NSString , 时间戳的转换
// 字符串时间 --> 转NSDate
+ (NSDate *)dateFromStringDate:(NSString *)stringDate format:(NSString *)format {
    NSDateFormatter *formatter = App.formatter;
    formatter.dateFormat = format;
    return [formatter dateFromString:stringDate];
}

// 时间戳 --> NSDate
+ (NSDate *)dateFromTimeInterval:(NSTimeInterval)timeInterval {
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

// NSDate --> 字符串
//+ (NSString *)stringDateFromDate:(NSDate *)date format:(NSString *)format {
//    NSDateFormatter *formatter = App.formatter;
//    formatter.dateFormat = format;
//    return [formatter stringFromDate:date];
//}
// NSDate --> 字符串
- (NSString *)stringFromDateWithformat:(NSString *)format {
    NSDateFormatter *formatter = App.formatter;
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

// NSTimeInterval --> 字符串
+ (NSString *)stringFromTimeInterval:(NSTimeInterval )timeInterval format:(NSString *)format {
    NSDateFormatter *formatter = App.formatter;
    formatter.dateFormat = format;
    return [formatter stringFromDate:[self dateFromTimeInterval:timeInterval]];
}

+ (NSTimeInterval)timeIntervalFromDate:(NSDate *)date {
    return [date timeIntervalSince1970];
}

// Date --> NSTimeInterval
- (NSTimeInterval)timeIntervalFromDate {
    return [self timeIntervalSince1970];
}

// 字符串时间 --> NSTimeInterval
+ (NSTimeInterval)timeIntervalFromString:(NSString *)stringDate {
    NSDate *date = [self dateFromStringDate:stringDate format:@"yyyy-MM-dd HH:mm:ss"];
   return [date timeIntervalSince1970];
}

@end
