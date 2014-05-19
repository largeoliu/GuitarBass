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
@synthesize seriesId = _seriesId;
@synthesize delegate = _delegate;
- (NSString*)url
{
    return [NSString stringWithFormat:@"atom/%@", _seriesId];
}
- (void)doElement:(GDataXMLElement*)xml
{
    [_delegate onReceiveInfoListSucceed:[[GBInfoList alloc] initWithXML:xml]];
}@end
