//
//  JZHub.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/15.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZHub.h"
#import <MBProgressHUD/MBProgressHUD.h>

static NSInteger const kDelayValue = 2;
@interface JZHub ()
@property (nonatomic,strong) UIWindow *hubWindow;
@property (nonatomic,strong) MBProgressHUD *mbHud;
@end

@implementation JZHub

+ (instancetype)shared{
    static JZHub *hub;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hub = [[JZHub alloc] init];
    });
    return hub;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (void)showSuccess:(NSString *)message {
    UIImage *image = [[UIImage imageNamed:@"jz_success"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self showMssage:message image:image];
}

+ (void)showError:(NSString *)message {
    UIImage *image = [[UIImage imageNamed:@"jz_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self showMssage:message image:image];
}

+ (void)showMssage:(NSString *)message image:(UIImage *)image {
    [self mb_hide];
    UIView *view = UIApplication.sharedApplication.delegate.window;
    if (!view) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    hud.label.numberOfLines = 1;
    hud.label.textColor = UIColor.whiteColor;
    hud.label.text = message;
    hud.minSize = CGSizeMake(100.f, 100.f);
    [hud hideAnimated:YES afterDelay:kDelayValue];
    JZHub *myHub = [self shared];
    myHub.mbHud = hud;
}

+ (void)showMessage:(NSString *)message {
    [self mb_hide];
    UIView *view = UIApplication.sharedApplication.delegate.window;
    if (!view) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    if (message.length < 18) {
        hud.label.textColor = UIColor.whiteColor;
        hud.label.text = message;
    }else{
        hud.detailsLabel.textColor = UIColor.whiteColor;
        hud.detailsLabel.text = message;
    }
    hud.margin = 20.f;
    //hud.offset = CGPointMake(0, -77);
    hud.removeFromSuperViewOnHide = YES;
    JZHub *myHub = [self shared];
    myHub.mbHud = hud;
    [hud hideAnimated:YES afterDelay:kDelayValue];
//    [self.hideDelayTimer invalidate];
//    NSTimer *timer = [NSTimer timerWithTimeInterval:delay target:self selector:@selector(handleHideTimer:) userInfo:@(animated) repeats:NO];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    self.hideDelayTimer = timer;
}

+ (void)mb_startLoding {
    [self mb_hide];
    UIView *view = UIApplication.sharedApplication.delegate.window;
    if (!view) {
        view = UIApplication.sharedApplication.keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    //hud.offset = CGPointMake(0, -77);
    hud.minSize = CGSizeMake(100.f, 100.f);
    [hud showAnimated:YES];
}

+ (void)mb_hide {
    JZHub *myHub = [self shared];
    MBProgressHUD *hud = myHub.mbHud;
    if (hud) {
        [hud hideAnimated:YES];
    }
//    UIView *view = [[self shared] hubWindow];
//    view.hidden = YES;
}

- (UIWindow *)hubWindow {
    if (!_hubWindow) {
        _hubWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //_hubWindow.jz_y = 20;
        _hubWindow.backgroundColor = UIColor.clearColor;
        _hubWindow.windowLevel = UIWindowLevelAlert;
        [_hubWindow makeKeyAndVisible];
        _hubWindow.hidden = YES;
    }
    return _hubWindow;
}

@end
