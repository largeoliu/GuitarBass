//
//  GBGetInfoListRequest.m
//  GuitarBass
//
//  Created by liuhao on 3/29/14.
//  Copyright (c) 2014 tinmanarts. All rights reserved.
//

#import "GBGetInfoListRequest.h"
#import "GBInfoList.h"
#import "GBInfoListRequestDelegate.h"
@implementation GBGetInfoListRequest
@synthesize delegate = _delegate;
- (NSString*)url
{
    return @"atom";
}
- (void)doElement:(GDataXMLElement*)xml
{
    [_delegate onReceiveInfoListSucceed:[[GBInfoList alloc] init:xml]];
}@end
