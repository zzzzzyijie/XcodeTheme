//
//  EmptyTool.m
//  JZDevHelperDemo
//
//  Created by Jie on 2019/4/23.
//  Copyright © 2019 www.noname.com. All rights reserved.
//

#import "EmptyTool.h"

@implementation EmptyTool

+ (BOOL)jz_isEmpty:(id)data{
    if (data == nil || data == NULL) {
        return YES;
    }
    if ([data isKindOfClass:[NSNull class]]){
        return YES;
    }
    if ([data isKindOfClass:[NSString class]]) {
        if ([[(NSString*)data stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
            return YES;
        }
        if ([(NSString *)data isEqualToString:@""]) {
            return YES;
        }
    }
    if ([data isKindOfClass:[NSDictionary class]]) {
        if ([(NSDictionary*)data count] <= 0) {
            return YES;
        }
    }
    if ([data isKindOfClass:[NSArray class]]) {
        if ([(NSArray*)data count] <= 0) {
            return YES;
        }
    }
    if ([data isKindOfClass:[NSData class]]) {
        if ([(NSData*)data length] <= 0) {
            return YES;
        }
    }
    return NO;
}

@end
