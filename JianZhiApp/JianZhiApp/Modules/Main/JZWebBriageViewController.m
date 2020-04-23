//
//  JZWebBridgeViewController.m
//  JianZhiApp
//
//  Created by Jie on 2020/4/14.
//  Copyright © 2020 com.jianzhi. All rights reserved.
//

#import "JZWebBriageViewController.h"
// Lib
#import <WebKit/WebKit.h>

@interface JZWebBriageViewController ()
<
WKNavigationDelegate,
WKUIDelegate,
WKScriptMessageHandler>

@property (nonatomic,copy) NSString *webUrl;
@property (nonatomic,copy) NSString *navTitle;

@property (nonatomic, strong) WKWebView *wkWebView;

@end

@implementation JZWebBriageViewController

- (instancetype)initWithUrl:(NSString *)url title:(NSString *)navTitle {
    if (self = [super init]) {
        self.webUrl = url;
        self.navTitle = navTitle;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupInit];
    
    [self setupContentUI];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - =================== Init Method ==================

- (void)setupInit{
    self.view.backgroundColor = UIColor.whiteColor;
    if (self.navTitle) {
        [self jz_setupNavTitle:self.navTitle];
    }
}


- (void)setupContentUI{
    
    // wkWebView
    [self.view addSubview:self.wkWebView];
    [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // Request
    if (self.webUrl) {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:self.webUrl] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0f];
        [self.wkWebView loadRequest:request];
    }
}


#pragma mark - WKScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    JZLog(@"%@",NSStringFromSelector(_cmd));
    JZLog(@"%@",message.body);
}

#pragma mark WKNavigationDelegate

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // KVO监听 ， 注意需要remove
}

// 开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    JZLog(@"1");
    // 可以在这里做正在加载的提示动画 然后在加载完成代理方法里移除动画
    [self jz_loadWithText:nil];
}

// 网络错误
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    // 在这里可以做错误提示
    JZLog(@"2");
}


// 网页加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self jz_hide];
    JZLog(@"3");
}

#pragma mark - ============== Lazy ============
- (WKWebView *)wkWebView {
    if (!_wkWebView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        //设置cookie
//        NSString *dt_cookie = [NSString stringWithFormat:@"document.cookie='dt=%@'",[JZLoginTool shareInstance].loginData.Token];
//        NSString *at_cookie = [NSString stringWithFormat:@"document.cookie='at=%@'",[JZLoginTool shareInstance].loginData.AccountToken];
//        WKUserContentController *userContentController = config.userContentController;
//        WKUserScript *dt_script = [[WKUserScript alloc] initWithSource:dt_cookie injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
//        WKUserScript *at_script = [[WKUserScript alloc] initWithSource:at_cookie injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
//        [userContentController addUserScript:dt_script];
//        [userContentController addUserScript:at_script];
        WKWebView *webView = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];
        if(@available(iOS 11.0, *)) {
            webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        webView.navigationDelegate = self;
        webView.UIDelegate = self;
        webView.allowsLinkPreview = NO;
        _wkWebView = webView;
    }
    return _wkWebView;
}



@end
