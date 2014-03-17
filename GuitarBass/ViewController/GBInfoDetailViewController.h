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

@interface GBInfoDetailViewController : AMScrollingNavbarViewController<UIWebViewDelegate>
{
    UIWebView *_webView;
    NSURLRequest *_urlRequest;
    GBInfoModel *_info;
}
- (void)loadWithInfo:(GBInfoModel*)info;
@end
