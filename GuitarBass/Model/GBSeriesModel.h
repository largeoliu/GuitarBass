//
//  GBSeriesModel.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//
@class GDataXMLElement;
@class FMResultSet;
@class FMDatabase;
@interface GBSeriesModel : NSObject
- (id)initWithXML:(GDataXMLElement*)xmlElement;
- (id)initWithSQL:(FMResultSet*)resultSet;
- (void)saveToSQL:(FMDatabase*)database tableName:(NSString*)tableName;
@property (nonatomic, strong) NSString *uniqueId;
@property (nonatomic, strong) NSString *title;
@end
