//
//  GBWebViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-17.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

@interface GBWebViewController : UIViewController<UIWebViewDelegate>
{
    UIWebView *_webView;
    NSURLRequest *_urlRequest;
}
- (void)loadWithRequest:(NSURLRequest*)request;
@end
