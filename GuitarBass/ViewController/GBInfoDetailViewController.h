//
//  GBInfoDetailViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBInfoModel.h"
#import "AMScrollingNavbarViewController.h"
@class ASIWebPageRequest;
@interface GBInfoDetailViewController : AMScrollingNavbarViewController<UIWebViewDelegate, UIScrollViewDelegate>
{
    UIWebView *_webView;
    NSURL *_url;
    GBInfoModel *_info;
    ASIWebPageRequest *_cacheRequest;
}
- (void)loadWithInfo:(GBInfoModel*)info;
@end
