//
//  JZNetworkManager.m
//  JZNetworkingDemo
//
//  Created by Jie on 2019/4/25.
//  Copyright © 2019 Jie. All rights reserved.
//

#import "JZNetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "AFHTTPSessionManager+RetryPolicy.h"
#import "JZNetworkRequest.h"

#define JZErrorDomain @"jianzhi.com.error"

@implementation JZNetworkManager

+ (NSURLSessionDataTask *)sendWithRequst:(JZNetworkRequest *)request
                                progress:(void (^)(NSProgress *))downloadProgress
                                 success:(void (^)(id _Nonnull, NSURLSessionDataTask * _Nonnull))success
                                 failure:(void (^)(NSError * _Nonnull, NSURLSessionDataTask * _Nonnull))failure {
    AFHTTPSessionManager *manager = [self getAFNManagerWithReq:request];
    NSURLSessionDataTask *task = nil;
    JZRequestMethod methodType = request.requestMethod;
    // -------------------------------------------GET-----------------------------------------------------------------
    if (methodType == RequestGET) {
        task = [manager GET:request.path parameters:request.param progress:downloadProgress success:^(NSURLSessionDataTask *task, id responseObject) {
            // todo
            [request setValue:responseObject forKey:@"_responseObject"];
            [self logResponeWithRequest:request];
            success([self afnRemoveNullValueKey:responseObject],task);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [request setValue:error forKey:@"_error"];
            [self logResponeWithRequest:request];
            failure(error,task);
        } retryCount:request.retryCount retryInterval:0 progressive:false fatalStatusCodes:@[]];
    // -------------------------------------------POST-----------------------------------------------------------------
    } else if (methodType == RequestPOST) {
        task = [manager POST:request.path parameters:request.param progress:downloadProgress success:^(NSURLSessionDataTask *task, id responseObject) {
            [request setValue:responseObject forKey:@"_responseObject"];
            [self logResponeWithRequest:request];
            NSInteger errorCode = [responseObject[@"errorCode"] integerValue];
            if (errorCode == 0) { // 成功
                success([self afnRemoveNullValueKey:responseObject],task);
            } else { // 失败
                failure([self creatErrorWithResponeObject:responseObject],task);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [request setValue:error forKey:@"_error"];
            [self logResponeWithRequest:request];
            failure(error,task);
        } retryCount:request.retryCount retryInterval:0 progressive:false fatalStatusCodes:@[]];
    // -------------------------------------------上传图片-----------------------------------------------------------------
    } else if (methodType == RequestUploadImage) { // 上传图片
        NSArray<UIImage *> *images = request.uploadImages;
        task = [manager POST:request.path parameters:request.param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                UIImage *targetImage = [self compressWithImage:obj maxValue:1000.f];
                NSData *imageData = UIImageJPEGRepresentation(targetImage, 0.5f);
                NSString *fileNameString = [NSString stringWithFormat:@"image%zd.png",idx];
                [formData appendPartWithFileData:imageData name:@"file" fileName:fileNameString mimeType:@"image/png"];
            }];
        } progress:^(NSProgress *uploadProgress) {
            if (downloadProgress) {
                downloadProgress(uploadProgress);
            }
        } success:^(NSURLSessionDataTask *task, id responseObject) {
            [request setValue:responseObject forKey:@"_responseObject"];
            [self logResponeWithRequest:request];
            NSInteger errorCode = [responseObject[@"errorCode"] integerValue];
            if (errorCode == 0) { // 成功
                success([self afnRemoveNullValueKey:responseObject],task);
            } else { // 失败
                failure([self creatErrorWithResponeObject:responseObject],task);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [request setValue:error forKey:@"_error"];
            [self logResponeWithRequest:request];
            failure(error,task);
        } retryCount:request.retryCount retryInterval:0 progressive:false fatalStatusCodes:@[]];
    // -------------------------------------------HEAD-----------------------------------------------------------------
    } else if (methodType == RequestHEAD) {
        task = [manager HEAD:request.path parameters:request.param success:^(NSURLSessionDataTask *task) {
            // todo
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [request setValue:error forKey:@"_error"];
            [self logResponeWithRequest:request];
            failure(error,task);
        } retryCount:request.retryCount retryInterval:0 progressive:false fatalStatusCodes:@[]];
    // -------------------------------------------PUT-----------------------------------------------------------------
    } else if (methodType == RequestPUT) {
        task = [manager PUT:request.path parameters:request.param success:^(NSURLSessionDataTask *task, id responseObject) {
             // todo
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [request setValue:error forKey:@"_error"];
            [self logResponeWithRequest:request];
            failure(error,task);
        } retryCount:request.retryCount retryInterval:0 progressive:false fatalStatusCodes:@[]];
    // -------------------------------------------PATCH-----------------------------------------------------------------
    } else if (methodType == RequestPATCH) {
        task = [manager PATCH:request.path parameters:request.param success:^(NSURLSessionDataTask *task, id responseObject) {
             // todo
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [request setValue:error forKey:@"_error"];
            [self logResponeWithRequest:request];
            failure(error,task);
        } retryCount:request.retryCount retryInterval:0 progressive:false fatalStatusCodes:@[]];
    // -------------------------------------------DELETE-----------------------------------------------------------------
    } else if (methodType == RequestDELETE) {
        task = [manager DELETE:request.path parameters:request.param success:^(NSURLSessionDataTask *task, id responseObject) {
             // todo
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [request setValue:error forKey:@"_error"];
            [self logResponeWithRequest:request];
            failure(error,task);
        } retryCount:request.retryCount retryInterval:0 progressive:false fatalStatusCodes:@[]];
    }
    return task;
}

+ (AFHTTPSessionManager *)getAFNManagerWithReq:(JZNetworkRequest *)request {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:request.baseURL]];
    
    // 1.请求序列化
    switch (request.requestType) {
        case JZRequestTypeHTTP:
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            break;
        case JZRequestTypeJSON:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        default:
            break;
    }
    
    // 2.响应序列化
    switch (request.responseType) {
        case JZResponseTypeJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case JZResponseTypeXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case JZResponseTypeNSData:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    // 3.添加type ( 这里一般不会经常变,所以没有提供自定义
    NSMutableSet *otherSet = [NSMutableSet set];
    otherSet.set = manager.responseSerializer.acceptableContentTypes;
    [otherSet addObject:@"text/html"];
    [otherSet addObject:@"text/plain"];
    manager.responseSerializer.acceptableContentTypes = otherSet;
    
    
    // 4.设置HTTPHeaderField （ 如 Accept、Content-Type 等这些
    NSDictionary *httpHeaderField = request.httpHeaderField;
    if (httpHeaderField) {
        for (NSString *headerKey in httpHeaderField.allKeys) {
            if (httpHeaderField[headerKey] != nil) {
                [manager.requestSerializer setValue:httpHeaderField[headerKey] forHTTPHeaderField:headerKey];
            }
        }
    }
    
    // 5.设置超时的时间 （默认60s）
    if (request.timeoutInterval > 0) {
        manager.requestSerializer.timeoutInterval = request.timeoutInterval;
    }
    
    // 6.其他一些通用的配置都可以在这里设置
    
    return manager;
}

#pragma mark - ============== Private Method ============
/**
 *  打印返回信息、处理状态
 */
+ (void)logResponeWithRequest:(JZNetworkRequest *)request{
    if (!request.isDebugLogger) {  return; }
    JZLog(@"============Start=============");
    JZLog(@"访问地址:%@\n",[NSString stringWithFormat:@"%@%@",request.baseURL,request.path]);
    JZLog(@"访问参数:%@\n",[NSString stringWithFormat:@"%@",request.param]);
    JZLog(@"Header:%@\n",[NSString stringWithFormat:@"%@",request.httpHeaderField]);
    if (request.error) {
        JZLog(@"错误信息:%@\n",request.error);
    }else {
        JZLog(@"返回结果:%@\n",request.responseObject);
    }
    JZLog(@"=============End==============");
}

/**
 *  过滤null value key (  reponse.removesKeysWithNullValues = YES 来设置的原因是 为了Log所有后台返回的数据，用于Debug和...
 */
+ (id)afnRemoveNullValueKey:(id)JSONObject{
    NSJSONReadingOptions readingOptions = NSJSONReadingAllowFragments;
    //分数组和字典
    if ([JSONObject isKindOfClass:[NSArray class]]) {
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:[(NSArray *)JSONObject count]];
        for (id value in (NSArray *)JSONObject) {
            //调用自己
            [mutableArray addObject:[self afnRemoveNullValueKey:value]];
        }
        //看我们解析类型是mutable还是非muatable,返回mutableArray或者array
        return (readingOptions & NSJSONReadingMutableContainers) ? mutableArray : [NSArray arrayWithArray:mutableArray];
        
    } else if ([JSONObject isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:JSONObject];
        for (id <NSCopying> key in [(NSDictionary *)JSONObject allKeys]) {
            id value = (NSDictionary *)JSONObject[key];
            //value空则移除
            if (!value || [value isEqual:[NSNull null]]) {
                [mutableDictionary removeObjectForKey:key];
            } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
                //如果数组还是去调用自己
                mutableDictionary[key] = [self afnRemoveNullValueKey:value];
            }
        }
        return (readingOptions & NSJSONReadingMutableContainers) ? mutableDictionary : [NSDictionary dictionaryWithDictionary:mutableDictionary];
    }
    return JSONObject;
}

// 创建一个‘请求成功’但为‘错误’的error
+ (NSError *)creatErrorWithResponeObject:(id)responseObject {
    NSString *errorMsg = @"";
    if (responseObject[@"errorMsg"]) {
        errorMsg = responseObject[@"errorMsg"];
    }
    NSInteger errorCode = [responseObject[@"errorCode"] integerValue];
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[NSLocalizedDescriptionKey] = errorMsg;
    userInfo[@"responseObject"] = responseObject;
    NSError *aError = [NSError errorWithDomain:JZErrorDomain code:errorCode userInfo:userInfo];
    return aError;
}

// 压缩图片
+ (UIImage *)compressWithImage:(UIImage *)image maxValue:(CGFloat)BOUNDARY {
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    CGSize targetSize = CGSizeMake(width, height);
    // 宽高均<= 设定长度，图片尺寸大小保持不变
    if (width <= BOUNDARY && height <= BOUNDARY) {
        targetSize = CGSizeMake(width, height);
    }
    
    //获取宽高系数
    CGFloat ratio = MAX(width, height) / MIN(width, height);
    
    // 宽或高> 设定长度 && 宽高比<= 2，取较大值等于设定长度，较小值等比例压缩
    if (ratio <= 2) {
        CGFloat MaxEdgeRatio = MAX(width, height) / BOUNDARY;
        if (width > height) {
            width = BOUNDARY;
            height = height / MaxEdgeRatio;
        } else {
            height = BOUNDARY;
            width = width / MaxEdgeRatio;
        }
    }else {
        // 宽高均> 设定长度 && 宽高比> 2，取较小值等于设定长度，较大值等比例压缩
        if (MIN(width, height) >= BOUNDARY) {
            CGFloat MinEdgeRatio = MIN(width, height) / BOUNDARY;
            if (width < height) {
                width = BOUNDARY;
                height = height / MinEdgeRatio;
            } else {
                height = BOUNDARY;
                width = width / MinEdgeRatio;
            }
        }
    }
    targetSize = CGSizeMake(width, height);
    
    NSData * data = UIImageJPEGRepresentation(image, 1);
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    CGImageSourceRef source = CGImageSourceCreateWithDataProvider(provider, NULL);
    
    NSUInteger imgSize = MAX(targetSize.width,targetSize.height);
    CGImageRef imageRef = CGImageSourceCreateThumbnailAtIndex(source, 0, (__bridge CFDictionaryRef) @{
                                                                                                      (NSString *)kCGImageSourceCreateThumbnailFromImageAlways : @YES,
                                                                                                      (NSString *)kCGImageSourceThumbnailMaxPixelSize : @(imgSize),
                                                                                                      (NSString *)kCGImageSourceCreateThumbnailWithTransform : @YES,
                                                                                                      });
    CFRelease(source);
    CFRelease(provider);
    
    if (!imageRef) {
        return nil;
    }
    
    UIImage *toReturn = [UIImage imageWithCGImage:imageRef];
    
    CFRelease(imageRef);
    
    return toReturn;
}

@end
