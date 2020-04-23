//
//  UIDevice+JZAdd.h
//  JZAppDemo
//
//  Created by Jie  on 2017/7/28.
//  Copyright © 2017年 Jie . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (JZAdd)
/// Device system version (e.g. 8.1)
+ (double)jz_systemVersion;

/// The device's machine model.  e.g. "iPhone6,1" "iPad4,6"
/// @see http://theiphonewiki.com/wiki/Models
@property (nullable, nonatomic, readonly) NSString *jz_machineModel;

@end
