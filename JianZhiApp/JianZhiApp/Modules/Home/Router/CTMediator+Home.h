//
//  CTMediator+Home.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <CTMediator/CTMediator.h>

NS_ASSUME_NONNULL_BEGIN
// scheme://[target]/[action]?[params]
@interface CTMediator (Home)

/**
 *  A控制器
 */
- (UIViewController *)getAViewController;

/**
 *   跳转H5通用交互界面JZWebBriageViewController
 
    param : {
             "title": "",   (title)
             "url": "",   (url)
 *           "type":1   ( type有值,且=1,则代表远程调用
            }
 *     需要定义
 // url 不能包含中文
 // 如： @"app scheme://Home/JZWebBriageViewController?type=1$title=jianzhi&url=https://jz.jianzhiweike.com!type_1$name_Jay";
 // 相当于远程调用跳转：JZWebBriageViewController（ title = jianzhi,url为https://jz.jianzhiweike.com?type=1&name=Jay
*/
- (UIViewController *)getWebBriageViewController:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
