//
//  GBRequest.m
//  GuitarBass
//
//  Created by liuhao on 3/29/14.
//  Copyright (c) 2014 tinmanarts. All rights reserved.
//

#import "GBRequest.h"
#import "ASIHTTPRequest.h"
#import "GDataXMLNode.h"
@implementation GBRequest
- (void)start
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ROOTURL, [self url]]];
    _cacheRequest = [[ASIHTTPRequest alloc] initWithURL:url];
    [_cacheRequest setDelegate:self];
    [_cacheRequest setDidFinishSelector:@selector(httpSucceeded:)];
    [_cacheRequest setDidFailSelector:@selector(httpFailed:)];
    [_cacheRequest startAsynchronous];
}

- (void)cancel
{
    [_cacheRequest clearDelegatesAndCancel];
    _cacheRequest = nil;
}

- (void)httpSucceeded:(ASIHTTPRequest *)theRequest
{
    NSString *responseString = [theRequest responseString];
    GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithXMLString:responseString options:0 error:nil];
    GDataXMLElement *xmlEle = [xmlDoc rootElement];
    [self doElement:xmlEle];
}

- (void)httpFailed:(ASIHTTPRequest *)theRequest
{
	
}

- (void)doElement:(GDataXMLElement*)xml
{

}

- (NSString*)url
{
    return nil;
}
@end