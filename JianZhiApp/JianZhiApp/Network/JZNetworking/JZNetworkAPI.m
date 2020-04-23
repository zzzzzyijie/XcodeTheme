//
//  JZNetworkAPI.m
//  JZNetworkingDemo
//
//  Created by Jie on 2019/4/25.
//  Copyright © 2019 Jie. All rights reserved.
//

#import "JZNetworkAPI.h"
#import "JZNetworkManager.h"

@implementation JZNetworkAPI

// GET
+ (NSURLSessionDataTask *)GET:(NSString *)urlString
                   parameters:(id)parameters progress:(void (^)(NSProgress *))downloadProgress
                      success:(void (^)(id _Nonnull))success
                      failure:(void (^)(NSError * _Nonnull))failure {
    JZNetworkRequest *req = [self _createRequest];
    req.requestMethod = RequestGET;
    req.path = urlString;
    req.param = parameters;
    return [self sendWithRequst:req progress:downloadProgress success:success failure:failure];
}

// POST
+ (NSURLSessionDataTask *)POST:(NSString *)urlString
                    parameters:(id)parameters
                      progress:(void (^)(NSProgress *))downloadProgress
                       success:(void (^)(id _Nonnull))success
                       failure:(void (^)(NSError * _Nonnull))failure {
    JZNetworkRequest *req = [self _createRequest];
    req.requestMethod = RequestPOST;
    req.path = urlString;
    req.param = parameters;
    return [self sendWithRequst:req progress:downloadProgress success:success failure:failure];
}

// HEAD
+ (NSURLSessionDataTask *)HEAD:(NSString *)urlString parameters:(id)parameters
                       success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *error))failure {
    JZNetworkRequest *req = [self _createRequest];
    req.requestMethod = RequestHEAD;
    req.path = urlString;
    req.param = parameters;
    return [self sendWithRequst:req progress:nil success:success failure:failure];
}

// PUT
+ (NSURLSessionDataTask *)PUT:(NSString *)urlString parameters:(id)parameters
                      success:(void(^)(id responseObject))success
                      failure:(void(^)(NSError *error))failure {
    JZNetworkRequest *req = [self _createRequest];
    req.requestMethod = RequestPUT;
    req.path = urlString;
    req.param = parameters;
    return [self sendWithRequst:req progress:nil success:success failure:failure];
}

// PATCH
+ (NSURLSessionDataTask *)PATCH:(NSString *)urlString parameters:(id)parameters
                        success:(void(^)(id responseObject))success
                        failure:(void(^)(NSError *error))failure {
    JZNetworkRequest *req = [self _createRequest];
    req.requestMethod = RequestPATCH;
    req.path = urlString;
    req.param = parameters;
    return [self sendWithRequst:req progress:nil success:success failure:failure];
}

// DELETE
+ (NSURLSessionDataTask *)DELETE:(NSString *)urlString parameters:(id)parameters
                         success:(void(^)(id responseObject))success
                         failure:(void(^)(NSError *error))failure {
    JZNetworkRequest *req = [self _createRequest];
    req.requestMethod = RequestDELETE;
    req.path = urlString;
    req.param = parameters;
    return [self sendWithRequst:req progress:nil success:success failure:failure];
}

+ (NSURLSessionDataTask *)UploadImageWithImageArray:(NSArray *)images
                                                url:(NSString *)urlString
                                         parameters:(id)parameters
                                           progress:(void (^)(NSProgress *))uploadProgress
                                            success:(void (^)(id))success
                                            failure:(void (^)(NSError *))failure {
    if (!images || images.count <= 0) {
        NSLog(@"%@",@"图片不能为空");
        return nil;
    }
    JZNetworkRequest *req = [self _createRequest];
    req.requestMethod = RequestUploadImage;
    //req.baseURL = @"";
    req.path = urlString;
    req.param = parameters;
    req.uploadImages = images;
    return [self sendWithRequst:req progress:uploadProgress success:success failure:failure];
}

+ (NSURLSessionDataTask *)sendWithRequst:(JZNetworkRequest *)request
                                progress:(void (^)(NSProgress *))downloadProgress
                                 success:(void (^)(id _Nonnull))success
                                 failure:(void (^)(NSError * _Nonnull))failure {
    return [JZNetworkManager sendWithRequst:request progress:downloadProgress success:^(id  _Nonnull responseObject, NSURLSessionDataTask * _Nonnull task) {
        success(responseObject);
    } failure:^(NSError * _Nonnull error, NSURLSessionDataTask * _Nonnull task) {
        failure(error);
    }];
}

+ (JZNetworkRequest *)_createRequest {
    JZNetworkRequest *req = [[JZNetworkRequest alloc] init];
    req.isDebugLogger = [self configIsDebugLogger];
    req.baseURL = [self configBaseURL];
    req.baseParam = [self configBaseParam];
    req.httpHeaderField = [self configHttpHeaderField];
    req.responseType = [self configResponseType];
    req.requestType = [self configRequestType];
    req.timeoutInterval = [self configTimeoutInterval];
    return req;
}


+ (BOOL)configIsDebugLogger {
    return NO;
}

+ (NSString *)configBaseURL {
    return nil;
}

+ (NSDictionary *)configBaseParam {
    return nil;
}

+ (NSDictionary *)configHttpHeaderField {
    return nil;
}

+ (JZResponseType)configResponseType {
    return JZResponseTypeJSON; // JSON 默认为JSON ( 与AFN保持一致
}

+ (JZRequestType)configRequestType {
    return JZRequestTypeHTTP;    // HTTP 默认为HTTP ( 与AFN保持一致
}

+ (NSTimeInterval)configTimeoutInterval {
    return 60.0f; // 默认60s超时
}

@end
