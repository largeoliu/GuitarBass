//
//  GBCacheManager.m
//  GuitarBass
//
//  Created by liuhao on 3/23/14.
//  Copyright (c) 2014 tinmanarts. All rights reserved.
//

#import "GBCacheManager.h"
#import "ASINetworkQueue.h"
#import "ASIWebPageRequest.h"
#import "ASIDownloadCache.h"
static GBCacheManager* s_manager = nil;
static NSString *s_cachePath = nil;
@implementation GBCacheManager

+ (GBCacheManager*)defaultManager
{
    if (!s_manager) {
        @synchronized(self) {
            if (!s_manager) {
                s_manager = [[GBCacheManager alloc] init];
            }
        }
    }
    return s_manager;
}

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

@end
