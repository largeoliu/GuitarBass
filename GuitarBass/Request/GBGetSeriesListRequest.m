//
//  GBGetSeriesListRequest.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBGetSeriesListRequest.h"
#import "GBSeriesListRequestDelegate.h"
#import "GBSeriesList.h"
@implementation GBGetSeriesListRequest
@synthesize delegate = _delegate;
- (NSString*)url
{
    return @"atom";
}
- (void)doElement:(GDataXMLElement*)xml
{
    [_delegate onReceiveSeriesListSucceed:[[GBSeriesList alloc] initWithXML:xml]];
}
@end
