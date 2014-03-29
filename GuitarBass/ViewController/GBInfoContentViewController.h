//
//  GBInfoContentViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-24.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "AMScrollingNavbarViewController.h"
@class GBInfoList;
@interface GBInfoContentViewController : AMScrollingNavbarViewController<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    GBInfoList *_infoList;
    NSInteger _currentIndex;
}
- (void)loadWithInfoList:(GBInfoList*)infoList forIndex:(NSInteger)index;
@end
