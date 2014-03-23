//
//  GBCacheManager.h
//  GuitarBass
//
//  Created by liuhao on 3/23/14.
//  Copyright (c) 2014 tinmanarts. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASINetworkQueue;
@interface GBCacheManager : NSObject
{
    ASINetworkQueue *_requestQueue;
}
+ (GBCacheManager*)defaultManager;
@end
