//
//  GBInfoListRequestDelegate.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//
#import "GBInfoList.h"
@protocol GBInfoListRequestDelegate <NSObject>
- (void)onReceiveInfoListSucceed:(GBInfoList*)infoList;
@end
