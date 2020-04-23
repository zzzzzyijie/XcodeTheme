//
//  CTMediator+Home.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "CTMediator+Home.h"

@implementation CTMediator (Home)

/**
 *  A控制器
 */
- (UIViewController *)getAViewController {
    return [self performTarget:@"Home" action:@"AViewController" params:nil shouldCacheTarget:NO];
}

/**
 *  webView控制器
 */
- (UIViewController *)getWebBriageViewController:(NSDictionary *)param {
    return [self performTarget:@"Home" action:@"JZWebBriageViewController" params:param shouldCacheTarget:NO];
}

@end
