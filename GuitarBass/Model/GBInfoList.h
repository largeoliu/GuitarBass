//
//  GBInfoList.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-14.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

@class GBInfoModel;
@class GDataXMLElement;
@class FMResultSet;
@class FMDatabase;
@interface GBInfoList : NSObject
{
    NSMutableArray *_array;
}
@property (nonatomic, strong) NSString *seriesId;
- (id)initWithXML:(GDataXMLElement*)xmlElement;
- (id)initWithSQL:(FMResultSet*)resultSet;
- (void)saveToSQL:(FMDatabase*)database tableName:(NSString*)tableName;
- (void)addInfo:(GBInfoModel*)info;
- (GBInfoModel*)infoAtIndex:(NSUInteger)index;
- (NSInteger)count;
@end
