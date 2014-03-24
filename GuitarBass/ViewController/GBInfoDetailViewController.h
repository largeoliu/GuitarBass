//
//  GBInfoDetailViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "AMScrollingNavbarViewController.h"
@class GBInfoModel;
@class ASIWebPageRequest;
@class AMScrollingNavbarViewController;
@interface GBInfoDetailViewController : AMScrollingNavbarViewController<UIWebViewDelegate, UIScrollViewDelegate>
{
    UIWebView *_webView;
    NSURL *_url;
    GBInfoModel *_info;
    ASIWebPageRequest *_cacheRequest;
}
- (void)loadWithInfo:(GBInfoModel*)info;
@end
