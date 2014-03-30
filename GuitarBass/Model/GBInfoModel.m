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
@synthesize seriesId = _seriesId;
@synthesize title = _title;
@synthesize thumbUrl = _thumbUrl;
@synthesize webUlr = _webUlr;
- (id)init:(GDataXMLElement*)xmlElement seriesId:(NSString*)seriesId
{
    self = [super init];
    if (self) {
        NSArray *array = [xmlElement children];
        for (int i = 0; i < [array count]; i++) {
            GDataXMLElement *ele = [array objectAtIndex:i];
            if ([[ele name] isEqualToString:@"title"]) {
                _title = [ele stringValue];
            }else if ([[ele name] isEqualToString:@"summary"]){
                _thumbUrl = [ele stringValue];
            }else if ([[ele name] isEqualToString:@"id"]){
                _webUlr = [NSString stringWithFormat:@"%@app/%@/%@", ROOTURL, seriesId, [ele stringValue]] ;
            }
        }
    }
    return self;
}
@end
