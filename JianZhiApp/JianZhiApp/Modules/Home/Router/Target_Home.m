//
//  Target_Home.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "Target_Home.h"
#import "JZWebBriageViewController.h"

@implementation Target_Home

/**
 *   跳转H5通用交互界面JZWebBriageViewController
 
    param : {
             "title": "",   (title)
             "url": "",   (url)
 *           "type":1   ( type有值,且=1,则代表远程调用
            }
 *     需要定义
 // 如： @"comddybwdingdong://Home/JZWebBriageViewController?type=1&url=https://jz.jianzhiweike.com!type_1$name_Jay";
*/
- (UIViewController *)Action_JZWebBriageViewController:(NSDictionary *)param {
    NSString *webUrl;
    NSString *webTitle;
    if (param) {
        // 这里对url进行截取为路由 （ 自定义的规则
        // url = (路径名)！(参数key_参数value)$(参数key_参数value)
        // 把 ! 替换为 ？
        // 把 _ 替换为 =
        // 吧 $ 替换为 &
        NSString *type = param[@"type"];
        NSString *url = param[@"url"];
        NSString *title = param[@"title"];
        if (type && [type isEqualToString:@"1"]) {
            if (url) {
                url = [url stringByReplacingOccurrencesOfString:@"!" withString:@"?"];
                url = [url stringByReplacingOccurrencesOfString:@"_" withString:@"="];
                url = [url stringByReplacingOccurrencesOfString:@"$" withString:@"&"];
            }
        }
        webUrl = url;
        webTitle = title;
    }
    JZWebBriageViewController *vc = [[JZWebBriageViewController alloc] initWithUrl:webUrl title:webTitle];
    return vc;
}


@end
