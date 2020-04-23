//
//  JZNetworkManager.h
//  JZNetworkingDemo
//
//  Created by Jie on 2019/4/25.
//  Copyright © 2019 Jie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class JZNetworkRequest;
@interface JZNetworkManager : NSObject

/**
 *  根据一个 request 发起一个请求
 *  request  请求对象
 *  success  成功的回调
 *  failure  失败的回调
 */
+ (NSURLSessionDataTask *)sendWithRequst:(JZNetworkRequest* )request
                                progress:(void (^)(NSProgress *))downloadProgress
                                 success:(void(^)(id responseObject,NSURLSessionDataTask *task))success
                                 failure:(void(^)(NSError *error,NSURLSessionDataTask *task))failure;

@end

NS_ASSUME_NONNULL_END
