//
//  GBSeriesList.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-14.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

@class GBSeriesModel;
@class GDataXMLElement;
@interface GBSeriesList : NSObject
{
    NSMutableArray *_array;
}
- (id)init:(GDataXMLElement*)xmlElement;
- (void)addInfo:(GBSeriesModel*)info;
- (GBSeriesModel*)infoAtIndex:(NSUInteger)index;
- (NSInteger)count;
@end
