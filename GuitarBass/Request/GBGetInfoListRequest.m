//
//  GBGetInfoListRequest.m
//  GuitarBass
//
//  Created by liuhao on 3/29/14.
//  Copyright (c) 2014 tinmanarts. All rights reserved.
//

#import "GBGetInfoListRequest.h"
#import "ASIHTTPRequest.h"

@implementation GBGetInfoListRequest
- (id)init
{
    self = [super init];
    if (self) {
        NSURL *url = [NSURL URLWithString:@"http://guitarbass.sinaapp.com/atom"];
        ASIHTTPRequest *_cacheRequest = [ASIHTTPRequest requestWithURL:url];
        [_cacheRequest setDelegate:self];
        [_cacheRequest setDidFailSelector:@selector(webPageFetchFailed:)];
        [_cacheRequest setDidFinishSelector:@selector(webPageFetchSucceeded:)];
        [_cacheRequest startAsynchronous];
    }
    return self;
}
@end
