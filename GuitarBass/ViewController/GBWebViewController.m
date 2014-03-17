//
//  GBWebViewController.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-17.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBWebViewController.h"

@interface GBWebViewController ()

@end

@implementation GBWebViewController

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
}

- (void)loadWithRequest:(NSURLRequest*)request
{
    _urlRequest = request;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [_webView loadRequest:_urlRequest];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = button;
}

- (void)cancel
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.title = [self webTitle];
}

- (NSString*)webTitle
{
    return [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
