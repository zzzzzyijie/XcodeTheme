//
//  JZBuyListViewController.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/21.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZBuyListViewController.h"
// Controller
// View
// Model
// ViewModel
// Lib
#import "JZTabbar.h"

@interface JZBuyListViewController ()

@end

@implementation JZBuyListViewController

#pragma mark - =================== Life Cycle ===================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupInit];
    
    [self loadRequest];
}

#pragma mark - =================== Init Method ==================
- (void)setupInit {
    
    [self jz_setupNavTitle:@"书院"];
    
    // this is test change
}

- (void)loadRequest {
    
}

#pragma mark - ===================== Delegate ====================


#pragma mark - ================== Private Method =================


#pragma mark - =================== Event Method ==================


#pragma mark - ==================== Lazy Method ==================


@end
