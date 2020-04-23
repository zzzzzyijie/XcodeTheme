//
//  JZNetworkAPI.h
//  JZNetworkingDemo
//
//  Created by Jie on 2019/4/25.
//  Copyright © 2019 Jie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZNetworkRequest.h"

@interface JZNetworkAPI : NSObject

// 自定义一个request
+ (NSURLSessionDataTask *)sendWithRequst:(JZNetworkRequest* )request
                                progress:(void (^)(NSProgress *progress))downloadProgress
                                 success:(void(^)(id responseObject))success
                                 failure:(void(^)(NSError *error))failure;

// GET
+ (NSURLSessionDataTask *)GET:(NSString *)urlString parameters:(id)parameters
                     progress:(void (^)(NSProgress *progress))downloadProgress
                      success:(void(^)(id responseObject))success
                      failure:(void(^)(NSError *error))failure;

// POST
+ (NSURLSessionDataTask *)POST:(NSString *)urlString parameters:(id)parameters
                      progress:(void (^)(NSProgress *progress))downloadProgress
                       success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *error))failure;

// HEAD （ responseObject 返回为 {}
+ (NSURLSessionDataTask *)HEAD:(NSString *)urlString parameters:(id)parameters
                       success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *error))failure;

// PUT 
+ (NSURLSessionDataTask *)PUT:(NSString *)urlString parameters:(id)parameters
                       success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *error))failure;

// PATCH
+ (NSURLSessionDataTask *)PATCH:(NSString *)urlString parameters:(id)parameters
                      success:(void(^)(id responseObject))success
                      failure:(void(^)(NSError *error))failure;

// DELETE
+ (NSURLSessionDataTask *)DELETE:(NSString *)urlString parameters:(id)parameters
                        success:(void(^)(id responseObject))success
                        failure:(void(^)(NSError *error))failure;

/**
 *  上传图片（ 这里的url是全局的，和baseUrl无关
 */
+ (NSURLSessionDataTask *)UploadImageWithImageArray:(NSArray *)images
                              url:(NSString *)urlString
                       parameters:(id)parameters
                         progress:(void (^)(NSProgress *))uploadProgress
                          success:(void(^)(id responseObject))success
                          failure:(void(^)(NSError *error))failure;
/**
 *  配置是否打印Log信息
 */
+ (BOOL)configIsDebugLogger;

/**
 *  配置Base参数
 */
+ (NSDictionary *)configBaseParam;

/**
 *  配置请求头
 */
+ (NSDictionary *)configHttpHeaderField;

/**
 *  配置返回【响应】序列化类型
 */
+ (JZResponseType)configResponseType;

/**
 *  配置返回【请求】序列化类型
 */
+ (JZRequestType)configRequestType;

/**
 *  配置超时时间
 */
+ (NSTimeInterval)configTimeoutInterval;


@end
