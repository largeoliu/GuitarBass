//
//  GBRequest.h
//  GuitarBass
//
//  Created by liuhao on 3/29/14.
//  Copyright (c) 2014 tinmanarts. All rights reserved.
//

@class GDataXMLElement;
@interface GBRequest : NSObject
- (void)start;
- (NSString*)url;
- (void)doElement:(GDataXMLElement*)xml;
@end
