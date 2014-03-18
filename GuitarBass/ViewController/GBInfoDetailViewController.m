//
//  GBInfoDetailViewController.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoDetailViewController.h"
#import "GBWebViewController.h"
#import "GBAppDelegate.h"
@interface GBInfoDetailViewController ()

@end

@implementation GBInfoDetailViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    CGRect tableFrame = self.view.bounds;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        tableFrame.size.height -= self.navigationController.navigationBar.bounds.size.height+20;
    }else{
        tableFrame.size.height -= self.navigationController.navigationBar.bounds.size.height;
    }
    
    _webView = [[UIWebView alloc] initWithFrame:tableFrame];
    [self.view addSubview:_webView];
    
    _webView.scalesPageToFit = YES;
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.delegate = self;
    _webView.dataDetectorTypes = UIDataDetectorTypeAll;
}

- (void)loadWithInfo:(GBInfoModel*)info
{
    _info = info;
    self.title = info.title;
    
    NSURL *url = [NSURL URLWithString:_info.webUlr];
    _urlRequest = [NSURLRequest requestWithURL:url];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_webView loadRequest:_urlRequest];
    [self followScrollView:_webView];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (![request.URL.absoluteString isEqual:_urlRequest.URL.absoluteString]) {
        GBWebViewController *webViewController = [[GBWebViewController alloc] init];
        [webViewController loadWithRequest:request];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:webViewController];
        [[GBAppDelegate defaultAppDelegate].menuController presentViewController:navigationController animated:YES completion:nil];
        [self reset];
        return NO;
    }
    return YES;
}


@end
