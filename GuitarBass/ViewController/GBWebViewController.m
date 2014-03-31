//
//  GBWebViewController.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-17.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBWebViewController.h"
#define WebToolBarHeight 44

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
        tableFrame.size.height -= WebToolBarHeight;
    }else{
        tableFrame.size.height -= self.navigationController.navigationBar.bounds.size.height+WebToolBarHeight;
    }
    
    _webView = [[UIWebView alloc] initWithFrame:tableFrame];
    [self.view addSubview:_webView];
    
    _webView.scalesPageToFit = YES;
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.delegate = self;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, _webView.frame.origin.y+_webView.frame.size.height, self.view.bounds.size.width, WebToolBarHeight)];
    toolbar.layer.anchorPoint = CGPointMake(0, 1);
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        toolbar.layer.position = CGPointMake(0, self.view.bounds.size.height);
    }else{
        toolbar.layer.position = CGPointMake(0, self.view.bounds.size.height-WebToolBarHeight);
    }
    toolbar.translucent = YES;
    [self.view addSubview:toolbar];
    
    UIBarButtonItem *refreshBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:_webView action:@selector(reload)];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:_webView action:@selector(goBack)];
    UIBarButtonItem *forwardBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:_webView action:@selector(goForward)];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolbar.items = [[NSArray alloc] initWithObjects:spaceItem, refreshBtn, spaceItem, backBtn, spaceItem,forwardBtn, spaceItem, nil];
}

- (void)reload
{
    [_webView reload];
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
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
        [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    }
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
