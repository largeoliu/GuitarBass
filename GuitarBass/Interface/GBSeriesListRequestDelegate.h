//
//  GBSeriesListRequestDelegate.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//
#import "GBSeriesList.h"
@protocol GBSeriesListRequestDelegate <NSObject>
- (void)onReceiveSeriesListSucceed:(GBSeriesList*)seriesList;
@end
