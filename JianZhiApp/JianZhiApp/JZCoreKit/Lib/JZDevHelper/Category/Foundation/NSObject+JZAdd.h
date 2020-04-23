/*******************************************************************************\
** JZDevHelperDemo:NSObject+JZAdd.h
** Created by Zengyijie(jackiezeng01@163.com) on 2018/11/22
**
**Copyright © 2018 www.noname.com. All rights reserved.
\*******************************************************************************/


#import <Foundation/Foundation.h>

@interface NSObject (JZAdd)
/**
 *  是否为空 ( 暂不可用
 *  支持对 （nil、NSNull、NSString、NSDictionary、NSArray）的判断
 */
//- (BOOL)jz_isEmpty;
/**
 *  是否为空或null
 *  仅仅判断nil或null
 */
@property (nonatomic,assign,readonly) BOOL isNilOrNull;

/**
 *  是否为不空或null
 *  仅仅判断nil或null
 */
@property (nonatomic,assign,readonly) BOOL isNotNilOrNull;


/**
 *  返回当前class name
 */
+ (NSString *)currentClassName;

@end


#pragma mark - 默认值（orEmpty）
@interface NSString (Empty)
@property (nonatomic,copy,readonly) NSString *orEmpty;
@end

@interface NSArray (Empty)
@property (nonatomic,copy,readonly) NSArray *orEmpty;
@end

@interface NSDictionary (Empty)
@property (nonatomic,copy,readonly) NSDictionary *orEmpty;
@end
