//
//  GBSeriesModel.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//
@class GDataXMLElement;
@interface GBSeriesModel : NSObject
- (id)init:(GDataXMLElement*)xmlElement;
@property (nonatomic, strong) NSString *uniqueId;
@property (nonatomic, strong) NSString *title;
@end
