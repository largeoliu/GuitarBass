//
//  GBInfoList.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-14.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoModel.h"

@interface GBInfoList : NSObject
{
    NSMutableArray *_array;
}
- (void)addInfo:(GBInfoModel*)info;
- (GBInfoModel*)infoAtIndex:(NSUInteger)index;
- (NSInteger)count;
@end
