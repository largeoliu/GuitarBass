//
//  GBGetSeriesListRequest.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBRequest.h"
@protocol GBSeriesListRequestDelegate;
@interface GBGetSeriesListRequest : GBRequest
@property (weak) id<GBSeriesListRequestDelegate> delegate;
@end
