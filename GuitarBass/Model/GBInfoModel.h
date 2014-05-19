//
//  GBInfoModel.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

@class GDataXMLElement;
@class FMResultSet;
@class FMDatabase;
@interface GBInfoModel : NSObject
- (id)initWithXML:(GDataXMLElement*)xmlElement seriesId:(NSString*)seriesId;
- (id)initWithSQL:(FMResultSet*)resultSet;
- (void)saveToSQL:(FMDatabase*)database tableName:(NSString*)tableName;
@property (nonatomic, strong) NSString *seriesId;
@property (nonatomic, strong) NSString *infoId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NSString *webUlr;
@end
