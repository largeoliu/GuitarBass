//
//  GBSeriesModel.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBSeriesModel.h"
#import "GDataXMLNode.h"
#import "FMResultSet.h"
@implementation GBSeriesModel
@synthesize uniqueId = _uniqueId;
@synthesize title = _title;
- (id)initWithXML:(GDataXMLElement*)xmlElement
{
    self = [super init];
    if (self) {
        NSArray *array = [xmlElement children];
        for (int i = 0; i < [array count]; i++) {
            GDataXMLElement *ele = [array objectAtIndex:i];
            if ([[ele name] isEqualToString:@"title"]) {
                _title = [ele stringValue];
            }else if ([[ele name] isEqualToString:@"id"]){
                _uniqueId = [ele stringValue];
            }
        }
    }
    return self;
}

- (id)initWithSQL:(FMResultSet*)resultSet
{
    self = [super init];
    if (self) {
        _uniqueId = [resultSet stringForColumn:@"seriesId"];
        _title = [resultSet stringForColumn:@"title"];
    }
    return self;
}
@end
