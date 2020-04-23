//
//  JZHomeViewController.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/14.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZHomeViewController.h"
// Controller
// View
// Model
// ViewModel
// Lib

@interface JZHomeViewController ()

@end

@implementation JZHomeViewController

#pragma mark - =================== Life Cycle ===================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupInit];
    
    [self loadRequest];
}

#pragma mark - =================== Init Method ==================
- (void)setupInit {
    
    [self jz_setupNavTitle:@"简知"];
    
}

- (void)loadRequest {
    
}

#pragma mark - ===================== Delegate ====================


#pragma mark - ================== Private Method =================


#pragma mark - =================== Event Method ==================


#pragma mark - ==================== Lazy Method ==================


@end

