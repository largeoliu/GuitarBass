//
//  GBSeriesList.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-14.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBSeriesList.h"

@implementation GBSeriesList
- (id)init
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
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
