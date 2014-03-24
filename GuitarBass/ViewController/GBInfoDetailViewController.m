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
#import "GBInfoModel.h"
#import "EGOImageView.h"
#import "ASIWebPageRequest.h"
#import "ASIDownloadCache.h"
#import "GBCacheManager.h"

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
        //tableFrame.size.height -= self.navigationController.navigationBar.bounds.size.height;
    }
    
    _webView = [[UIWebView alloc] initWithFrame:tableFrame];
    [self.view addSubview:_webView];
    
    _webView.scalesPageToFit = YES;
    _webView.multipleTouchEnabled = NO;
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.delegate = self;
    _webView.dataDetectorTypes = UIDataDetectorTypeAll;
    _webView.scrollView.delegate = self;
}

- (void)fetchURL:(NSURL *)url
{
	[_cacheRequest setDelegate:nil];
	[_cacheRequest cancel];
	_cacheRequest = [ASIWebPageRequest requestWithURL:url];
    [_cacheRequest setDelegate:self];
    [_cacheRequest setDidFailSelector:@selector(webPageFetchFailed:)];
	[_cacheRequest setDidFinishSelector:@selector(webPageFetchSucceeded:)];
	[_cacheRequest setUrlReplacementMode:ASIReplaceExternalResourcesWithLocalURLs];
	[_cacheRequest setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
	[_cacheRequest setDownloadCache:[ASIDownloadCache sharedCache]];
	[_cacheRequest setCachePolicy:ASIOnlyLoadIfNotCachedCachePolicy];
	[_cacheRequest setDownloadDestinationPath:[[ASIDownloadCache sharedCache] pathToStoreCachedResponseDataForRequest:_cacheRequest]];
    [[ASIDownloadCache sharedCache] setShouldRespectCacheControlHeaders:NO];
	[_cacheRequest startAsynchronous];
}

- (void)webPageFetchFailed:(ASIHTTPRequest *)theRequest
{
	
}

- (void)webPageFetchSucceeded:(ASIHTTPRequest *)theRequest
{
    NSURL *baseURL = [NSURL fileURLWithPath:[theRequest downloadDestinationPath]];
    
    NSString *response = [NSString stringWithContentsOfFile:[theRequest downloadDestinationPath] encoding:[theRequest responseEncoding] error:nil];
    [_webView loadHTMLString:response baseURL:baseURL];
}

- (void)loadWithInfo:(GBInfoModel*)info
{
    _info = info;
    self.title = info.title;
    
    _url = [NSURL URLWithString:_info.webUlr];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchURL:_url];
    [self followScrollView:_webView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return nil;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *baseURL = [NSURL fileURLWithPath:[_cacheRequest downloadDestinationPath]];
    NSString *requstStr = [request.URL.absoluteString hasSuffix:@"/"]?request.URL.absoluteString:[request.URL.absoluteString stringByAppendingString:@"/"];
    NSString *webStr = [baseURL.absoluteString hasSuffix:@"/"]?baseURL.absoluteString:[baseURL.absoluteString stringByAppendingString:@"/"];
    
    if (![requstStr isEqualToString:webStr]) {
        GBWebViewController *webViewController = [[GBWebViewController alloc] init];
        [webViewController loadWithRequest:request];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:webViewController];
        [[GBAppDelegate defaultAppDelegate] presentViewController:navigationController];
        [self reset];
        return NO;
    }
    
    return YES;
}

- (void)dealloc
{
    [_cacheRequest clearDelegatesAndCancel];
	[_cacheRequest cancel];
}

@end
