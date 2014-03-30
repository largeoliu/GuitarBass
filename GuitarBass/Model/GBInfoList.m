//
//  GBInfoList.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-14.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoList.h"
#import "GBInfoModel.h"
#import "GDataXMLNode.h"
@implementation GBInfoList
@synthesize seriesId = _seriesId;
- (id)init:(GDataXMLElement*)xmlElement
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
        NSArray *array = [xmlElement children];
        for (int i = 0; i < [array count]; i++) {
            GDataXMLElement *ele = [array objectAtIndex:i];
            if ([[ele name] isEqualToString:@"entry"]) {
                GBInfoModel *info = [[GBInfoModel alloc] init:ele seriesId:_seriesId];
                [_array addObject:info];
            }else if ([[ele name] isEqualToString:@"id"]){
                _seriesId = [ele stringValue];
            }
        }
    }
    return self;
}

- (void)addInfo:(GBInfoModel*)info
{
    [_array addObject:info];
}

- (GBInfoModel*)infoAtIndex:(NSUInteger)index
{
    return [_array objectAtIndex:index];
}

- (NSInteger)count
{
    return [_array count];
}
@end
