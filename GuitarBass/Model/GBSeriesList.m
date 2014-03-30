//
//  GBSeriesList.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-14.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBSeriesList.h"
#import "GBSeriesModel.h"
#import "GDataXMLNode.h"
@implementation GBSeriesList
- (id)init:(GDataXMLElement*)xmlElement
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
        NSArray *array = [xmlElement children];
        for (int i = 0; i < [array count]; i++) {
            GDataXMLElement *ele = [array objectAtIndex:i];
            if ([[ele name] isEqualToString:@"entry"]) {
                GBSeriesModel *series = [[GBSeriesModel alloc] init:ele];
                [_array addObject:series];
            }
        }
    }
    return self;
}

- (void)addInfo:(GBSeriesModel*)info
{
    [_array addObject:info];
}

- (GBSeriesModel*)infoAtIndex:(NSUInteger)index
{
    return [_array objectAtIndex:index];
}

- (NSInteger)count
{
    return [_array count];
}
@end
