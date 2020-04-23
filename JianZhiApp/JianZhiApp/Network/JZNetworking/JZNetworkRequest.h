//
//  JZNetworkRequest.h
//  JZNetworkingDemo
//
//  Created by Jie on 2019/4/25.
//  Copyright © 2019 Jie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,JZRequestMethod){
    RequestGET = 0,
    RequestPOST,
    RequestHEAD,
    RequestPUT,
    RequestPATCH,
    RequestDELETE,
    RequestUploadImage // 上传图片
};

typedef NS_ENUM(NSInteger,JZResponseType){
    JZResponseTypeJSON = 0,     // JSON 默认为JSON ( 与AFN保持一致
    JZResponseTypeXML,          // XML
    JZResponseTypeNSData        // NSData
};

typedef NS_ENUM(NSInteger,JZRequestType){
    JZRequestTypeHTTP = 0,     // HTTP 默认为HTTP ( 与AFN保持一致
    JZRequestTypeJSON          // JSON
};

@interface JZNetworkRequest : NSObject

/**
 *  是否打印Log
 */
@property (nonatomic,assign) BOOL isDebugLogger;

/**
 *  初始化时需要设置一个默认值
 */
@property (nonatomic,copy) NSString *baseURL;

/**
 *  接口名字 ( 拼接到baseURL
 */
@property (nonatomic,copy) NSString *path;

/**
 *  httpHeaderField ( key - value
 */
@property (nonatomic,copy) NSDictionary *httpHeaderField;

/**
 *  公共参数（如token这些
 */
@property (nonatomic,copy) NSDictionary *baseParam;

/**
 *  接口参数
 */
@property (nonatomic,copy) NSDictionary *param;

/**
 *  图片（上传图片
 */
@property (nonatomic,copy) NSArray<UIImage *> *uploadImages;

/**
 *  重连次数
 */
@property (nonatomic,assign) NSInteger retryCount;

/**
 *  请求类型
 */
@property (nonatomic,assign) JZRequestMethod requestMethod;

/**
 *  返回序列化类型 默认JOSN
 */
@property (nonatomic,assign) JZResponseType responseType;

/**
 *  请求序列化类型  默认HTTP
 */
@property (nonatomic,assign) JZRequestType requestType;

/**
 *  超时时间
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 *  返回的数据
 */
@property (nonatomic,strong,readonly) id responseObject;

/**
 *  返回的错误
 */
@property (nonatomic,strong,readonly) NSError *error;

/**
 *  请求类型字符串
 */
@property (nonatomic,copy,readonly) NSString *requestMethodString;

@end

NS_ASSUME_NONNULL_END
