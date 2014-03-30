//
//  GBInfoModel.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

@class GDataXMLElement;
@interface GBInfoModel : NSObject
- (id)init:(GDataXMLElement*)xmlElement seriesId:(NSString*)seriesId;
@property (nonatomic, strong) NSString *seriesId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NSString *webUlr;
@end
