//
//  Target_Home.h
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_Home : NSObject

/**
 *   跳转H5通用交互界面JZWebBriageViewController
 
    param : {
             "title": "",   (title)
             "url": "",   (url)
 *           "type":1   ( type有值,且=1,则代表远程调用
            }
 *     需要定义
 // 如： @"comddybwdingdong://Home/JZWebBriageViewController?type=1&url=https://jz.jianzhiweike.com";
*/
- (UIViewController *)Action_JZWebBriageViewController:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
