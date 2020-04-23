//
//  JZPersonalCenterViewController.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/14.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZPersonalCenterViewController.h"

@interface JZPersonalCenterViewController ()

@end

@implementation JZPersonalCenterViewController

#pragma mark - =================== Life Cycle ===================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupInit];
    
    [self loadRequest];
}

#pragma mark - =================== Init Method ==================
- (void)setupInit {
    
    [self jz_setupNavTitle:@"个人中心"];
    
}

- (void)loadRequest {
    
}

#pragma mark - ===================== Delegate ====================


#pragma mark - ================== Private Method =================


#pragma mark - =================== Event Method ==================


#pragma mark - ==================== Lazy Method ==================

@end
