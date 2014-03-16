//
//  GBInfoDetailViewController.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoDetailViewController.h"

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
        tableFrame.size.height -= 20;
    }else{
         tableFrame.size.height -= self.navigationController.navigationBar.bounds.size.height;
    }
    
    _webView = [[UIWebView alloc] initWithFrame:tableFrame];
    [self.view addSubview:_webView];
    
    _webView.scalesPageToFit = YES;
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.delegate = self;
}

- (void)loadWithInfo:(GBInfoModel*)info
{
    _info = info;
    self.title = info.title;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:_info.webUlr];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self followScrollView:_webView];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return NO;
}


@end
