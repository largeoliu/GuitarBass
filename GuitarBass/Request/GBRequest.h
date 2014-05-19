//
//  GBRequest.h
//  GuitarBass
//
//  Created by liuhao on 3/29/14.
//  Copyright (c) 2014 tinmanarts. All rights reserved.
//

@class GDataXMLElement;
@class ASIHTTPRequest;
@interface GBRequest : NSObject
{
    ASIHTTPRequest *_cacheRequest;
}
- (void)start;
- (void)cancel;
- (NSString*)url;
- (void)doElement:(GDataXMLElement*)xml;
@end
