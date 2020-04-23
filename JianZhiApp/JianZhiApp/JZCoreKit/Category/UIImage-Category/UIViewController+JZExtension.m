//
//  UIViewController+JZExtension.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/13.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "UIViewController+JZExtension.h"
#import <MBProgressHUD/MBProgressHUD.h>

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (JZExtension)

+ (void)load {
#if JZDEBUG
    // 便于查看 ViewController
    [self jz_swizzleSEL:@selector(viewDidLoad) withSEL:@selector(jz_viewDidLoad) forClass:[self class]];
#else
#endif
//        [self jz_swizzleSEL:@selector(viewWillAppear:) withSEL:@selector(jz_viewWillAppear:) forClass:[self class]];
//        [self jz_swizzleSEL:@selector(viewWillDisappear:) withSEL:@selector(jz_viewWillDisappear:) forClass:[self class]];
//        [self jz_swizzleSEL:@selector(viewDidDisappear:) withSEL:@selector(jz_viewDidDisappear:) forClass:[self class]];

    // 转圈的样式
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = UIColor.whiteColor;
}

#pragma mark - ============== LifeCycle ============

- (void)jz_viewDidLoad {
    [self jz_viewDidLoad];
    JZLog(@"进入%@",NSStringFromClass([self class]));
}

- (void)jz_viewWillAppear:(BOOL)animated {
    [self jz_viewWillAppear:animated];
}

- (void)jz_viewWillDisappear:(BOOL)animated {
    [self jz_viewWillDisappear:animated];
}

- (void)jz_viewDidDisappear:(BOOL)animated {
    [self jz_viewDidDisappear:animated];
    if (self.navigationController.viewControllers.count != 1) {
        [self jz_hide];
    }
}

// 记录hub作为属性
- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)jz_showHint:(NSString *)hint{
    [self jz_showHint:hint inView:self.view];
}

- (void)jz_showHintInkeyWindow:(NSString *)hint {
    UIView *view = UIApplication.sharedApplication.delegate.window;
    if (!view) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    [self jz_showHint:hint inView:view];
}

// 默认1.5秒
- (void)jz_showHint:(NSString *)hint inView:(UIView *)view{
    [self jz_showHint:hint inView:view delay:1.5f];
}

- (void)jz_showHint:(NSString *)hint inView:(UIView *)view delay:(NSTimeInterval)delay{
    [self jz_hide]; // 先hide
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //hud.bezelView.backgroundColor = UIColor.blackColor;
    hud.bezelView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    if (hint.length < 18) {
        hud.label.textColor = UIColor.whiteColor;
        hud.label.text = hint;
    }else{
        hud.detailsLabel.textColor = UIColor.whiteColor;
        hud.detailsLabel.text = hint;
    }
    hud.margin = 20.f;
    //hud.offset = CGPointMake(0, -77);
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:delay];
    [self setHUD:hud];
}

- (void)jz_loadWithText:(NSString *)text{
    [self jz_loadWithText:text inView:self.view];
}

- (void)jz_loadWithTextInkeyWindow:(NSString *)text {
    UIView *view = UIApplication.sharedApplication.delegate.window;
    if (!view) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    [self jz_loadWithText:text inView:view];
}

- (void)jz_loadWithText:(NSString *)text inView:(UIView *)view{
    [self jz_hide];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    hud.label.text = text;
    //hud.offset = CGPointMake(0, -77);
    [hud showAnimated:YES];
    [self setHUD:hud];
}

// 默认添加到self.view上
- (void)jz_showWithError:(NSError *)error {
    [self jz_hide];
    if (!error) {
        return;
    }
    NSString *domain = error.domain;
    //NSInteger errorCode = error.code;
    if ([domain isEqualToString:@"jianzhi.com.error"]) { // 请求成功的错误
        [self jz_showHint:error.localizedDescription inView:self.view delay:2];
    } else {
        [self jz_showHint:kErrorMsg inView:self.view delay:2];
    }
}

- (void)jz_hide{
    MBProgressHUD *hud = [self HUD];
    if (hud) {
        [hud hideAnimated:YES];
    }
}

// 返回到指定控制器
- (void)backToViewControllWithClass:(Class)cls withSEL:(nullable SEL)sel param:(nullable id)param {
    NSMutableArray *array = @[].mutableCopy;
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:cls]) {
            [array addObject:controller];
        }
    }
    UIViewController *lastVc = (UIViewController *)array.lastObject;
    if (sel) {
        if ([lastVc respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [lastVc performSelector:sel withObject:param?param:nil];
#pragma clang diagnostic pop
        }
    }
    if (lastVc) {
        [self.navigationController popToViewController:lastVc animated:YES];
    }
}


@end
