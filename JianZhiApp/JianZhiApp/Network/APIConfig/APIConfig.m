//
//  APIConfig.m
//  DDCollectApp
//
//  Created by Jie on 2020/1/3.
//  Copyright © 2020 ddybw. All rights reserved.
//

#import "APIConfig.h"

@implementation APIConfig
//+ (void)load {
//    [APIConfig shareInstance];
//}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        
        NSString *apiBaseUrl = infoDict[@"API_BASE_URL"];
        if (apiBaseUrl) {
            if (self.configType == DebugType) { // debug 拼接 http
                _apiBaseUrl = [NSString stringWithFormat:@"http://%@",apiBaseUrl];
            }else {
                _apiBaseUrl = [NSString stringWithFormat:@"https://%@",apiBaseUrl];
            }
        }
        
        NSString *domainBaseUrl = infoDict[@"DOMAIN_BASE_URL"];
        if (domainBaseUrl) {
            if (self.configType == DebugType) {
                _domainBaseUrl = [NSString stringWithFormat:@"http://%@",domainBaseUrl];
            }else {
                _domainBaseUrl = [NSString stringWithFormat:@"https://%@",domainBaseUrl];
            }
        }
        
    }
    return self;
}

- (AppConfigType)configType {
#if DEBUG
    return DebugType;
#elif AppTest
    return AppTestType;
#elif ReleaseBeta
    return AppReleaseType;
#else
    return Release;
#endif
}

static APIConfig *_inastance = nil;
#pragma mark - 单例
+(id)allocWithZone:(struct _NSZone *)zone{
    //调用dispatch_once保证在多线程中也只被实例化一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _inastance = [super allocWithZone:zone];
    });
    return _inastance;
}

+ (instancetype)shareInstance {
    // dispatch_once_t确保初始化器只执行一次
    static dispatch_once_t oncePredicate;
    // 单例的关键，一旦类被初始化，初始化器不会再被调用
    dispatch_once(&oncePredicate, ^{
        _inastance = [[APIConfig alloc] init];
    });
    return _inastance;
}

/**第4步: 保证copy时都相同*/
-(id)copyWithZone:(NSZone *)zone{
    return _inastance;
}

@end
