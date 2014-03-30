//
//  GBInfoList.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-14.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

@class GBInfoModel;
@class GDataXMLElement;
@interface GBInfoList : NSObject
{
    NSMutableArray *_array;
}
@property (nonatomic, strong) NSString *seriesId;
- (id)init:(GDataXMLElement*)xmlElement;
- (void)addInfo:(GBInfoModel*)info;
- (GBInfoModel*)infoAtIndex:(NSUInteger)index;
- (NSInteger)count;
@end
