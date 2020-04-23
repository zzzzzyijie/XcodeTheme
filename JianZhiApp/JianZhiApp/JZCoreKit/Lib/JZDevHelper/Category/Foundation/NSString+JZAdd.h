//
//  NSString+JZAdd.h
//  BaibuSeller
//
//  Created by Jie on 16/4/18.
//  Copyright © 2016年 whawhawhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JZAdd)

#pragma mark - Drawing

/**
 *  根据文字长度计算size
 *
 *  @param font          字体
 *  @param size          控件size
 *  @param lineBreakMode 模式
 *
 *  @return Size
 */
- (CGSize)jz_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/**
 *  根据文字的长度计算所占的宽度
 */
- (CGFloat)jz_widthForFont:(UIFont *)font;


/**
 *  根据文字的长度和宽度计算所占的高度
 */
- (CGFloat)jz_heightForFont:(UIFont *)font width:(CGFloat)width;


/// 根据字体、行数、和指定的宽度计算文本占据的高度
/// @param font 字体
/// @param maxLine 最大显示多小行
/// @param width 最大的宽度
/// 注意：这个并没有包含lineSpace
- (CGFloat)jz_heightForFont:(UIFont*)font maxLine:(NSInteger)maxLine width:(CGFloat)width;


#pragma mark - Utils

/**
 *  过滤前后的空格
 */
- (NSString *)stringByTrim;

/**
 *  是否包含中文
 */
- (BOOL)jz_isContainChinese;

/**
 *  是否包含某个字符串
 *
 *  @param string 目标字符串
 *
 *  @return 若包含则返回YES,否则返回No
 */
- (BOOL)jz_containsString:(NSString *)string;

/**
 *  是否包含表情
 *
 *  @param string 某段文字string
 *
 *  @return YES or NO
 */
+ (BOOL)jz_stringContainsEmoji:(NSString *)string;

/**
 *  字符串转为NSNumber
 *
 *  @return number类型
 */
- (NSNumber *)jz_numberValue;


/**
 *  Returns an NSData using UTF-8 encoding.
 */
- (NSData *)jz_dataValue;


#pragma mark - RegexCategory
/**
 *  邮箱的有效性
 */
- (BOOL)jz_isEmailAddress;

/**
 *  精确的身份证号码有效性检测
 *
 *  @param value 身份证号
 */
+ (BOOL)jz_accurateVerifyIDCardNumber:(NSString *)value;

/**
 *  车牌号的有效性
 */
- (BOOL)jz_isCarNumber;

/**
 *  银行卡的有效性
 */
- (BOOL)jz_bankCardluhmCheck;

/**
 *  IP地址有效性
 */
- (BOOL)jz_isIPAddress;

/**
 *  Mac地址有效性
 */
- (BOOL)jz_isMacAddress;

/**
 *  网址有效性
 */
- (BOOL)jz_isValidUrl;

/**
 *  纯汉字
 */
- (BOOL)jz_isValidChinese;

/**
 *  邮政编码
 */
- (BOOL)jz_isValidPostalcode;

/**
 *  工商税号
 */
- (BOOL)jz_isValidTaxNo;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)jz_isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)jz_isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;


#pragma mark - File Manager
// -----> 注意 这里的路径为绝对路径 <----- NSFileManager 这个类


/**
 *  获取 Docmument 路径
 *
 *  @return Docmument 路径
 */
+ (NSString *)jz_docmumentPath;

/**
 *  获取 caches 路径
 *
 *  @return caches 路径
 */
+ (NSString *)jz_cachesPath;

/**
 *  根据一个文件名，拼接到Docmument的文件路径
 *
 *  @return 返回该路径
 */
- (NSString *)jz_appendingToDocmument;

/**
 *  根据一个文件名，拼接到Caches的文件路径
 *
 *  @return 返回该路径
 */
- (NSString *)jz_appendingToCaches;

/**
 *  检测文件时候存在
 *
 *  @return 时候存在
 */
- (BOOL)jz_exist;

/**
 *  是否是文件夹
 *
 *  @return 是否是文件夹
 */
- (BOOL)jz_isDirectory;

/**
 *  创建文件夹
 *
 *  @return 创建文件夹
 */
- (BOOL)jz_createFolder;

/**
 *  复制到这个路径
 *
 *  @param path 绝对路径
 *
 *  @return 是否成功
 */
- (BOOL)jz_copyTo:(NSString *)path;

/**
 *  移动到这个路径
 *
 *  @param path 路径
 *
 *  @return 是否成功
 */
- (BOOL)jz_moveTo:(NSString *)path;

/**
 *  删除文件
 *
 *  @return 是否成功
 */
- (BOOL)jz_remove;

/**
 *  获取文件的信息
 *
 *  @return 文件的字典信息 属性...等
 */
- (NSDictionary *)jz_getFileInfoAtPath;

/**
 *  获取某个文件或文件夹的大小
 *
 *  @return 文件/文件夹大小
 */
- (unsigned long long)jz_getFileSize;

#pragma mark - 字符串操作
/**
 *  截取到某个位置
 */
- (NSString *)substringToIndexSafe:(NSUInteger)to;

/**
 *  从某个位置开始截取
 */
- (NSString *)substringFromIndexSafe:(NSInteger)from;

/**
 *  删除字符串中的首字符
 */
- (NSString *)deleteFirstCharacter;

/**
 *  删除字符串中的末尾字符
 */
- (NSString *)deleteLastCharacter;

@end







