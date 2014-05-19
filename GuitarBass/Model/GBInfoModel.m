//
//  GBInfoModel.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoModel.h"
#import "GDataXMLNode.h"
#import "FMDatabase.h"
@implementation GBInfoModel
@synthesize seriesId = _seriesId;
@synthesize infoId = _infoId;
@synthesize title = _title;
@synthesize thumbUrl = _thumbUrl;
@synthesize webUlr = _webUlr;
- (id)initWithXML:(GDataXMLElement*)xmlElement seriesId:(NSString*)seriesId
{
    self = [super init];
    if (self) {
        _seriesId = seriesId;
        NSArray *array = [xmlElement children];
        for (int i = 0; i < [array count]; i++) {
            GDataXMLElement *ele = [array objectAtIndex:i];
            if ([[ele name] isEqualToString:@"title"]) {
                _title = [ele stringValue];
            }else if ([[ele name] isEqualToString:@"summary"]){
                _thumbUrl = [ele stringValue];
            }else if ([[ele name] isEqualToString:@"id"]){
                _infoId = [ele stringValue];
                _webUlr = [NSString stringWithFormat:@"%@app/%@/%@", ROOTURL, seriesId, _infoId] ;
            }
        }
    }
    return self;
}

- (id)initWithSQL:(FMResultSet*)resultSet
{
    self = [super init];
    if (self) {
        _title = [resultSet stringForColumn:@"title"];
        _thumbUrl = [resultSet stringForColumn:@"thumbUrl"];
        _seriesId = [resultSet stringForColumn:@"seriesId"];
        _infoId = [resultSet stringForColumn:@"infoId"];
        _webUlr = [NSString stringWithFormat:@"%@app/%@/%@", ROOTURL, _seriesId, _infoId];
    }
    return self;
}

- (void)saveToSQL:(FMDatabase*)database tableName:(NSString*)tableName
{
    [database executeUpdate:[NSString stringWithFormat:@"INSERT INTO %@ VALUES('%@','%@', '%@', '%@');", tableName, _seriesId, _infoId, _title, _thumbUrl]];
}
@end
