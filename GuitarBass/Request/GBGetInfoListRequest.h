//
//  GBGetInfoListRequest.h
//  GuitarBass
//
//  Created by liuhao on 3/29/14.
//  Copyright (c) 2014 tinmanarts. All rights reserved.
//

#import "GBRequest.h"
@protocol GBInfoListRequestDelegate;
@interface GBGetInfoListRequest : GBRequest
@property (nonatomic, strong) NSString *seriesId;
@property (weak) id<GBInfoListRequestDelegate> delegate;
@end
