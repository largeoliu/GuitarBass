//
//  GBInfoDetailView.h
//  GuitarBass
//
//  Created by liuhao on 3/25/14.
//  Copyright (c) 2014 tinmanarts. All rights reserved.
//

@class GBInfoModel;
@class ASIWebPageRequest;
@interface GBInfoDetailView : UIView<UIWebViewDelegate>
{
    UIWebView *_webView;
    NSURL *_url;
    GBInfoModel *_info;
    ASIWebPageRequest *_cacheRequest;
}
- (void)loadWithInfo:(GBInfoModel*)info;
@end
