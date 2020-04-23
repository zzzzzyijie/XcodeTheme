//
//  JZNetworkRequest.m
//  JZNetworkingDemo
//
//  Created by Jie on 2019/4/25.
//  Copyright © 2019 Jie. All rights reserved.
//

#import "JZNetworkRequest.h"

@interface JZNetworkRequest()

@end

@implementation JZNetworkRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        _responseType = JZResponseTypeJSON;
        _requestType = JZRequestTypeHTTP;
        _retryCount = 3; 
    }
    return self;
}

- (void)setParam:(NSDictionary *)param {
    NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:_baseParam];
    [mDict addEntriesFromDictionary:param];
    _param = mDict;
}

- (void)setResponseObject:(id)responseObject {
    if (!responseObject) {
        return;
    }
    _responseObject = responseObject;
}

- (void)setError:(NSError * _Nonnull)error {
    if (!error) {
        return;
    }
    _error = error;
}

- (NSString *)requestMethodString {
    switch (self.requestMethod) {
        case RequestGET:
            return @"GET";
            break;
        case RequestPOST:
            return @"POST";
            break;
        case RequestHEAD:
            return @"HEAD";
            break;
        case RequestPUT:
            return @"PUT";
            break;
        case RequestPATCH:
            return @"PATCH";
            break;
        case RequestDELETE:
            return @"DELETE";
            break;
        default:
            return @"GET";
            break;
    }
}

@end
