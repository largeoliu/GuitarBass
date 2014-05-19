//
//  GBSeriesList.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-14.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

@class GBSeriesModel;
@class GDataXMLElement;
@class FMResultSet;
@class FMDatabase;
@interface GBSeriesList : NSObject
{
    NSMutableArray *_array;
}
- (id)initWithXML:(GDataXMLElement*)xmlElement;
- (id)initWithSQL:(FMResultSet*)resultSet;
- (void)saveToSQL:(FMDatabase*)database tableName:(NSString*)tableName;
- (void)addSeries:(GBSeriesModel*)series;
- (GBSeriesModel*)seriesAtIndex:(NSUInteger)index;
- (NSInteger)count;
@end
