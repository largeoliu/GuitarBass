//
//  GBInfoModel.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoModel.h"
#import "GDataXMLNode.h"
@implementation GBInfoModel
@synthesize title = _title;
@synthesize thumbUrl = _thumbUrl;
@synthesize webUlr = _webUlr;
- (id)init:(GDataXMLElement*)xmlElement
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
@end
