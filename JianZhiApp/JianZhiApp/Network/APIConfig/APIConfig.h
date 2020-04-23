//
//  APIConfig.h
//  DDCollectApp
//
//  Created by Jie on 2020/1/3.
//  Copyright © 2020 ddybw. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,AppConfigType) {
    DebugType, // 开发环境
    AppTestType, // 测试环境
    AppReleaseType, // 外网正式
    Release // 外网正式
};

NS_ASSUME_NONNULL_BEGIN

@interface APIConfig : NSObject

+ (instancetype)shareInstance;

/** AppConfigType */
@property (nonatomic,assign,readonly) AppConfigType configType;

/** 请求接口url */
@property (nonatomic,copy,readonly) NSString *apiBaseUrl;

/** 域名url */
@property (nonatomic,copy,readonly) NSString *domainBaseUrl;

/** 上传图片url */
//@property (nonatomic,copy,readonly) NSString *uploadImageUrl;


// --------- h5请求页面 ------------- //



@end

NS_ASSUME_NONNULL_END
