//
//  UIDevice+JZAdd.m
//  JZAppDemo
//
//  Created by Jie  on 2017/7/28.
//  Copyright © 2017年 Jie . All rights reserved.
//

#import "UIDevice+JZAdd.h"
#include <sys/socket.h>
#include <sys/sysctl.h>

@implementation UIDevice (JZAdd)

+ (double)jz_systemVersion {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}

- (NSString *)jz_machineModel {
    static dispatch_once_t one;
    static NSString *model;
    dispatch_once(&one, ^{
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *machine = malloc(size);
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        model = [NSString stringWithUTF8String:machine];
        free(machine);
    });
    return model;
}


@end
